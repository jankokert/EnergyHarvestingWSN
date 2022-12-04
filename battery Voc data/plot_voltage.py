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



def calc(r):
	#lowess = sm.nonparametric.lowess(r.Qout, r.Vout, frac=0.1)
	#Qout_smooth, Vout_smooth = lowess[:, 1], lowess[:, 0]

	Vout_smooth = savitzky_golay(r.Vout, 9, 3) # window size 51, polynomial order 3

	#dx = np.gradient(Qout_smooth, 1)
	#dy = np.gradient(Vout_smooth, 1)
	dx = np.gradient(r.Qout, 2)
	dy = np.gradient(r.Vout, 2)

	gradient = savitzky_golay(dy/dx, 9, 3).clip(min=-0.5)
	lin_i = np.argmax(gradient) # get index with the lowest slope
	m = gradient[lin_i]
	Q0 = r.Qout[lin_i]
	V0 = r.Vout[lin_i]
	print (m, Q0, V0)

	Vlin = V0 + m*(r.Qout-Q0)

	return sim(
		Qout = r.Qout,
		Vout = r.Vout,
		Vout_sim = Vlin,      #Vout_smooth,
		Iout = r.Iout,
		klin = gradient
	)


def plotVout_Qout(axis, rec):
	rec = calc(rec)
	axis.plot(rec.Qout, rec.Vout, label=f"Iout={rec.Iout}A")
	axis.plot(rec.Qout, rec.Vout_sim, label=f"smoothed")
	axis.plot(rec.Qout, rec.klin, label=f"klin")
	axis.legend()
	axis.set_xlabel(ltx_Qout + " in Ah")
	axis.set_ylabel(ltx_Vout + " in V")


fig, ax = plt.subplots(1,1)
ax.grid()
#ax.set_xlim([0,2])
#ax.set_ylim([0.4,1.4])
#ax.set_yticks(np.arange(0, 100, 20))
plotVout_Qout(ax, eneloopAA_0A2)
#plotVout_Qout(ax, eneloopAA_0A5)


	
#if not converter.endswith("export"):
#	mng = plt.get_current_fig_manager()
#	mng.window.wm_geometry("+1920+0")
#	fig.set_size_inches([18,9.5], forward = True)

plt.show()
