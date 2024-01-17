import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
from collections import namedtuple
record = namedtuple("record", "Vout Qout Iout")
sim = namedtuple("sim", "Vout Qout Iout Vout_sim klin")
#sim = namedtuple("sim", "Vout Qout Iout klin")


#https://stackoverflow.com/questions/20618804/how-to-smooth-a-curve-in-the-right-way
#import statsmodels.api as sm
from filters import savitzky_golay

# Set the default color cycle
custom_cycler = (mpl.cycler(color=list('rgb'))  *  mpl.cycler(linestyle=['-', '-.']))
mpl.rcParams['axes.prop_cycle'] = custom_cycler

from eneloopAA import *

# https://stackoverflow.com/questions/23824687/text-does-not-work-in-a-matplotlib-label
ltx_Qout = r"$Q_\mathrm{out}$"
ltx_Vout = r"$V_\mathrm{out}$"

export_path = "./"
plt.rcParams["font.size"] = 14  #12
plt.rcParams['savefig.dpi'] = 160 # 100


def calc(r):
	# for linear term: find the smallest slope m (gradient)
	dx = np.gradient(r.Qout, 2)
	dy = np.gradient(r.Vout, 2)

	gradient = savitzky_golay(dy/dx, 9, 3).clip(min=-0.5)  # window size 9, polynomial order 3

	# get index with the lowest slope
	lin_i = np.argmax(gradient) 
	
	# look 10% left and right of this index
	m_width = 0.1 
	m_section = gradient[int(lin_i*(1-m_width)) : int(lin_i*(1+m_width))]
	m = np.mean(m_section)

	# supporting point for m to build the linear equation
	Q0 = r.Qout[lin_i]
	V0 = r.Vout[lin_i]
	Vlin = V0 + m*(r.Qout-Q0)

	print (m, Q0, V0)

	return sim(
		Qout = r.Qout,
		Vout = r.Vout,
		Vout_sim = Vlin,
		Iout = r.Iout,
		klin = gradient
	)


def plotVout_Qout(axis, rec):
	rec = calc(rec)
	axis.plot(rec.Qout, rec.Vout, label=f"Iout={rec.Iout}A")
	axis.plot(rec.Qout, rec.Vout_sim, label=f"smoothed")
	#axis.plot(rec.Qout, rec.klin, label=f"klin")
	axis.legend()
	axis.set_xlabel(ltx_Qout + " in Ah")
	axis.set_ylabel(ltx_Vout + " in V")


fig, ax = plt.subplots(1,1)
ax.grid()
ax.set_xlim([0,2])
ax.set_ylim([1.10,1.4])
#ax.set_yticks(np.arange(0, 100, 20))
plotVout_Qout(ax, eneloopAA_0A2)
#plotVout_Qout(ax, eneloopAA_0A5)
	
plt.show()

fig.tight_layout()
fig.savefig(export_path + "eneloopAA-Vout.png", bbox_inches="tight", pad_inches = 0.01)
