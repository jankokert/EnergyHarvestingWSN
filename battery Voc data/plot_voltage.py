import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
from collections import namedtuple
record = namedtuple("record", "Vout Qout Iout")
sim = namedtuple("sim", "Vout Qout Iout Vout_sim gradient QlinStart QlinCenter QlinEnd ltxLabel")


#https://stackoverflow.com/questions/20618804/how-to-smooth-a-curve-in-the-right-way
#import statsmodels.api as sm
from filters import savitzky_golay
from eneloopAA import *

# https://stackoverflow.com/questions/23824687/text-does-not-work-in-a-matplotlib-label
ltx_Qout = r"$Q_\mathrm{out}$"
ltx_Vout = r"$V_\mathrm{out}$"

export_path = "./"
plt.rcParams["font.size"] = 14
plt.rcParams['figure.figsize'] = [7.0, 4]
plt.rcParams['savefig.dpi'] = 160


def calc(r):
	# for linear term: find the smallest slope m (gradient)
	dx = np.gradient(r.Qout, 2)
	dy = np.gradient(r.Vout, 2)

	gradient = savitzky_golay(dy/dx, 9, 3).clip(min=-0.5)  # window size 9, polynomial order 3

	# get index with the lowest slope
	i_center = np.argmax(gradient)
	i_total = len(gradient)
	print(f"lowest gradient at index {i_center}, total: {i_total}")
	
	# width of the linear region wrt the total width
	rel_width = 0.2
	i_halfwidth = int(rel_width*i_total/2)
	i_start = max(int(i_center - i_halfwidth), 0)
	i_end = min(int(i_center + i_halfwidth), i_total)
	print(f"section is from index {i_start} to {i_end}")
	m_section = gradient[i_start : i_end]

	# calcualte the slope within this section
	m = np.mean(m_section)

	# supporting point for m to build the linear equation
	Q0 = r.Qout[i_center]
	V0 = r.Vout[i_center]
	Vlin = V0 + m*(r.Qout-Q0)

	print(m, Q0, V0)

	return sim(
		Qout = r.Qout,
		Vout = r.Vout,
		Vout_sim = Vlin,
		Iout = r.Iout,
		gradient = gradient,
		QlinStart = r.Qout[i_start],
		QlinCenter = r.Qout[i_center],
		QlinEnd = r.Qout[i_end],
		ltxLabel = f"${round(V0,3)}V{round(m,4)}\cdot Q_\mathrm{{out}}$"
	)


def plotVout_Qout(axis, rec):
	rec = calc(rec)
	axis.plot(rec.Qout, rec.Vout, "r", label=f"Iout={rec.Iout}A")
	axis.plot(rec.Qout, rec.Vout_sim, "b--", label=f"linear section fit: {rec.ltxLabel}")
	# for debugging
	if debug:
		axis.plot(rec.Qout, rec.gradient, label="gradient")
		axis.vlines(rec.QlinStart, 0, 2, colors="gray")
		axis.vlines(rec.QlinCenter, 0, 2, colors="gray")
		axis.vlines(rec.QlinEnd, 0, 2, colors="gray")
		print(f"QlinStart: {rec.QlinStart}, QlinEnd:{rec.QlinEnd}")
	axis.legend()
	axis.set_xlabel(ltx_Qout + " in Ah")
	axis.set_ylabel(ltx_Vout + " in V")


debug = False
fig, ax = plt.subplots(1,1)
ax.grid()
#ax.grid(visible=True, which='major', color='gray', linestyle='-')
ax.grid(visible=True, which='minor', alpha=0.2)
ax.minorticks_on()

if not debug:
	ax.set_xlim([0,2])
	ax.set_ylim([1.10,1.45])
	plt.xticks(np.arange(0, 2.001, 0.5))
	plt.yticks(np.arange(1.1, 1.401, 0.1))

plotVout_Qout(ax, eneloopAA_0A4)
plt.show()

fig.tight_layout()
fig.savefig(export_path + "eneloopAA-Vout.pdf", bbox_inches="tight", pad_inches = 0.01)
