import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
from collections import namedtuple
record = namedtuple("record", "Vin Iin Vout Iout Eff")
sim = namedtuple("sim", "Vin Iin Vout Iout Eff Ploss EffSim PlossSim IoutSim")
modelparam = namedtuple("modelparam", "LossConst LossIin LossIinSqr LossVin")

# Set the default color cycle
custom_cycler = (mpl.cycler(color=list('rgb'))  *  mpl.cycler(linestyle=['-', '-.']))
mpl.rcParams['axes.prop_cycle'] = custom_cycler

from ADP5090 import *
from BQ25570boost import *
from BQ25570buck import *

# https://stackoverflow.com/questions/23824687/text-does-not-work-in-a-matplotlib-label
ltx_Vin = r"$V_\mathrm{in}$"
ltx_Iin = r"$I_\mathrm{in}$"

#https://stackoverflow.com/questions/17197492/is-there-a-library-function-for-root-mean-square-error-rmse-in-python
def rmse(predictions, targets):
    return np.sqrt(((predictions - targets) ** 2).mean())


def calc(r, p):
	# check if Iout is empty and an efficiency sweep is given (e.g. boost converter)
	if r.Iout is None and isinstance(r.Eff, np.ndarray):
		Vin = r.Vin
		Iin = r.Iin
		Vout = r.Vout
		Pin = Vin * Iin

		Ploss = Pin * (1-r.Eff)
		Iout = r.Eff * Pin / Vout
		Pout = Vout * Iout

	# check if Iin is empty and an efficiency sweep is given (e.g. buck converter)
	if r.Iin is None and isinstance(r.Eff, np.ndarray):
		Vin = r.Vin
		Vout = r.Vout
		Iout = r.Iout
		Pout = Vout * Iout

		Ploss = Pout * (1-r.Eff) / r.Eff
		Iin = Pout / r.Eff / r.Vin
		Pin = Vin * Iin


	# SIMULATION
	# y-Verschiebung für ganz kleine Iin - (3) fitten  - Einheit: [W]
	PL_const = p.LossConst                     # k3

	# y-Verschiebung bei verschiedenen Iin - (2) fitten  - Einheit: [V]
	PL_Iin = p.LossIin * Iin                   # k1

	# y-Verschiebung bei verschiedenen Iin, jedoch mit stärkerem Effekt im Iin-Sweep
	PL_Vin_root = p.LossVin * Iin * Vin**0.5   # k2

	# reduziert eff für hohe Iin
	PL_Iin_sqr = p.LossIinSqr * Iin**2         # k4

	PlossSim = PL_const + PL_Iin + PL_Vin_root + PL_Iin_sqr
	EffSim = np.maximum(0, 1 - PlossSim / Pin)
	IoutSim = EffSim * Pin / Vout

	return sim(
		Vin = r.Vin,
		Iin = Iin,
		Vout = r.Vout,
		Iout = Iout,
		Eff = r.Eff,
		Ploss = Ploss,
		EffSim = EffSim,
		PlossSim = PlossSim,
		IoutSim = IoutSim
	)




def plotEffPloss_Vin(ax, row, col, rec, param):
	if isinstance(rec.Iin, float):
		labels = [f"Iin={rec.Iin*1E3}mA, Vout={rec.Vout}V",  f"SIM: {rec.Iin*1E3}mA"]
	elif isinstance(rec.Iout, float):
		labels = [f"Iout={rec.Iout*1E3}mA, Vout={rec.Vout}V",  f"SIM: {rec.Iout*1E3}mA"]
	else:
		return

	plotEff_Vin(ax[row,col], rec, param, labels)
	plotPloss_Vin(ax[row,col+1], rec, param, labels)

def plotEff_Vin(axis, rec, param, labels):
	rec = calc(rec, param)
	print(f"RMSE: { format(rmse(rec.Eff, rec.EffSim)*100, '.3f') }% @Vin-sweep,  Iin = {rec.Iin} ")
	axis.plot(rec.Vin, rec.Eff*100, label=labels[0])
	axis.plot(rec.Vin, rec.EffSim*100, label=labels[1])
	axis.legend()
	axis.set_xlabel(ltx_Vin + " in V")

def plotPloss_Vin(axis, rec, param, labels):
	rec = calc(rec, param)	
	axis.plot(rec.Vin, rec.Ploss, label=labels[0])
	axis.plot(rec.Vin, rec.PlossSim, label=labels[1])
	axis.legend()
	axis.set_xlabel(ltx_Vin + " in V")



def plotEffPloss_Iin(ax, row, col, rec, param):
	labels = [f"Vin={rec.Vin}V, Vout={rec.Vout}V", f"SIM: {rec.Vin}V"]
	plotEff_Iin(ax[row,col], rec, param, labels)
	plotPloss_Iin(ax[row,col+1], rec, param, labels)

def plotEff_Iin(axis, rec, param, labels):
	rec = calc(rec, param)
	print(f"RMSE: { format(rmse(rec.Eff, rec.EffSim)*100, '.3f') }% @Iin-sweep,  Vin = {rec.Vin} ")
	axis.semilogx(rec.Iin, rec.Eff*100, label=labels[0])
	axis.semilogx(rec.Iin, rec.EffSim*100, label=labels[1])
	axis.legend()
	axis.set_xlabel(ltx_Iin + " in A")
	axis.set_ylabel(r"Efficiency $\mathrm{\eta}$ in %")

def plotPloss_Iin(axis, rec, param, labels):
	rec = calc(rec, param)
	axis.plot(rec.Iin, rec.Ploss, label=labels[0])
	axis.plot(rec.Iin, rec.PlossSim, label=labels[1])
	axis.legend()
	axis.set_xlabel(ltx_Iin + " in A")



def plotEffPloss_Iout(ax, row, col, rec, param):
	rec = calc(rec, param)
	label = f"Vin={rec.Vin}V, Vout={rec.Vout}V"
	label_sim = f"SIM: {rec.Vin}V"
	ax[row,col].semilogx(rec.Iout, rec.Eff, label=label)
	ax[row,col].semilogx(rec.IoutSim, rec.EffSim, label=label_sim)
	ax[row,col].legend()
	ax[row,col].set_xlabel("Iout in A")

	ax[row,col+1].plot(rec.Iout, rec.Ploss, label=label)
	ax[row,col+1].plot(rec.Iout, rec.PlossSim, label=label_sim)
	ax[row,col+1].legend()
	ax[row,col+1].set_xlabel("Iout in A")



###############################################################


VoutM = 3
#converter = "ADP5090"
converter = "ADP5090export"
#converter = "BQ2570boost"
#converter = "BQ2570buck"

#ADP5090
k4 = 3.15 - 0.6*VoutM
if VoutM == 2:
	adp5090 = modelparam(
		LossIin = 0.0113,
		LossVin = 0.110,
		LossConst = 0.65E-6,
		#LossIinSqr = 1.5 # für Vin=0.2V
		LossIinSqr = k4  #1.95 # für Vin=0.5V
		#LossIinSqr = 2.5 # für Vin=1.0V
	)

if VoutM == 3:
	adp5090 = modelparam(
		LossIin = 0.010,
		LossVin = 0.110,
		LossConst = 1.2E-6,
		#LossIinSqr = 1.2 #für Vin=0.2V
		LossIinSqr = k4  #1.35 #für alle 
	)

if VoutM == 5:
	adp5090 = modelparam(
		LossIin = 0.027,
		LossVin = 0.120,
		LossConst = 2.7E-6,
		LossIinSqr = k4  #0.15
	)




# for BQ2570boost
if VoutM == 2:
	BQ25570boost = modelparam(
		LossIin = 0.011,
		LossVin = 0.114,
		LossConst = 1.2E-6,
		LossIinSqr = 1
	)

if VoutM == 3:
	BQ25570boost = modelparam(
		LossIin = 0.011,
		LossVin = 0.095,
		LossConst = 2.0E-6,
		LossIinSqr = 0.2
	)
if VoutM == 5.5:
	BQ25570boost = modelparam(
		LossIin = 0.00175,
		LossVin = 0.13,
		LossConst = 4.5E-6,
		LossIinSqr = 0.3
	)	


export_path = "./"
plt.rcParams["font.size"] = 14  #12
#plt.rcParams['figure.figsize'] = [6.0, 4.0]  # [8.0, 6.0]
plt.rcParams['savefig.dpi'] = 160 # 100


if converter == "ADP5090":
	fig, ax = plt.subplots(2,2)
	param = adp5090
	if VoutM == 2:
		plotEffPloss_Iin(ax, 0,0, adp5090_0V2_Iin___2V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, adp5090_0V5_Iin___2V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, adp5090_1V0_Iin___2V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_10uA___2V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_100uA___2V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_10mA___2V0_eff, param)
	elif VoutM == 3:
		plotEffPloss_Iin(ax, 0,0, adp5090_0V2_Iin___3V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, adp5090_0V5_Iin___3V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, adp5090_1V0_Iin___3V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_10uA___3V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_100uA___3V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_10mA___3V0_eff, param)
	elif VoutM == 5:
		plotEffPloss_Iin(ax, 0,0, adp5090_0V2_Iin___5V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, adp5090_0V5_Iin___5V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, adp5090_1V0_Iin___5V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_10uA___5V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_100uA___5V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, adp5090_Vin_10mA___5V0_eff, param)


if converter == "ADP5090export":
	param = adp5090
	if VoutM == 2:
		fig, ax = plt.subplots(1,1)
		ax.grid()
		ax.set_ylim([0,100])
		ax.set_yticks(np.arange(0, 100, 20))
		plotEff_Iin(ax, adp5090_0V2_Iin___2V0_eff, param, [ltx_Vin + r"=0.2 V", None])
		plotEff_Iin(ax, adp5090_0V5_Iin___2V0_eff, param, [ltx_Vin + r"=0.5 V", None])
		plotEff_Iin(ax, adp5090_1V0_Iin___2V0_eff, param, [ltx_Vin + r"=1.0 V", None])
		fig.tight_layout()
		fig.savefig(export_path + "Efficiency_Iin.png", bbox_inches="tight", pad_inches = 0.01)

		fig, ax = plt.subplots(1,1)
		ax.grid()
		ax.set_ylim([0,100])
		ax.set_xlim([0,3])
		ax.set_yticks(np.arange(0, 100, 20))
		plotEff_Vin(ax, adp5090_Vin_10uA___2V0_eff, param, [ltx_Iin + r"$=10\;\mathrm{\mu A}$", None])
		plotEff_Vin(ax, adp5090_Vin_100uA___2V0_eff, param, [ltx_Iin + r"$=100\;\mathrm{\mu A}$", None])
		plotEff_Vin(ax, adp5090_Vin_10mA___2V0_eff, param, [ltx_Iin + r"$=10\;\mathrm{mA}$", None])
		fig.tight_layout()
		fig.savefig(export_path + "Efficiency_Vin.png", bbox_inches="tight", pad_inches = 0.01)

	if VoutM == 3:
		fig, ax = plt.subplots(1,1)
		ax.grid()
		ax.set_xlim([1E-5,4E-2])
		ax.set_ylim([0,100])
		plotEff_Iin(ax, adp5090_0V2_Iin___3V0_eff, param, [ltx_Vin + r"=0.2 V", None])
		plotEff_Iin(ax, adp5090_0V5_Iin___3V0_eff, param, [ltx_Vin + r"=0.5 V", None])
		plotEff_Iin(ax, adp5090_1V0_Iin___3V0_eff, param, [ltx_Vin + r"=1.0 V", None])
		fig.tight_layout()
		fig.savefig(export_path + "Efficiency_Iin.png", bbox_inches="tight", pad_inches = 0.01)

		fig, ax = plt.subplots(1,1)
		ax.grid()
		ax.set_xlim([0,3])
		ax.set_ylim([0,100])
		plotEff_Vin(ax, adp5090_Vin_10uA___3V0_eff, param, [ltx_Iin + r"$=10\;\mathrm{\mu A}$", None])
		plotEff_Vin(ax, adp5090_Vin_100uA___3V0_eff, param, [ltx_Iin + r"$=100\;\mathrm{\mu A}$", None])
		plotEff_Vin(ax, adp5090_Vin_10mA___3V0_eff, param, [ltx_Iin + r"$=10\;\mathrm{mA}$", None])
		fig.tight_layout()
		fig.savefig(export_path + "Efficiency_Vin.png", bbox_inches="tight", pad_inches = 0.01)



if converter == "BQ2570boost":
	fig, ax = plt.subplots(2,2)
	param = BQ25570boost
	if VoutM == 2:
		plotEffPloss_Iin(ax, 0,0, bq25570boost_0V2_Iin___2V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, bq25570boost_1V0_Iin___2V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, bq25570boost_Vin_10uA___2V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, bq25570boost_Vin_100uA___2V0_eff, param)
	elif VoutM == 3:
		plotEffPloss_Iin(ax, 0,0, bq25570boost_0V2_Iin___3V0_eff, param)
		plotEffPloss_Iin(ax, 0,0, bq25570boost_1V0_Iin___3V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, bq25570boost_Vin_10uA___3V0_eff, param)
		plotEffPloss_Vin(ax, 1,0, bq25570boost_Vin_100uA___3V0_eff, param)
	elif VoutM == 5.5:
		plotEffPloss_Iin(ax, 0,0, bq25570boost_0V2_Iin___5V5_eff, param)
		plotEffPloss_Iin(ax, 0,0, bq25570boost_1V0_Iin___5V5_eff, param)
		#                    n/a: bq25570boost_Vin_10uA___3V0_eff
		plotEffPloss_Vin(ax, 1,0, bq25570boost_Vin_100uA___5V5_eff, param)
		


if converter == "BQ2570buck":
	fig, ax = plt.subplots(2,2)
	param = BQ25570boost
	if VoutM == 1.8:
		plotEffPloss_Iin(ax, 0,0, bq25570buck_2V1_eff___1V8_Iout, param)
		plotEffPloss_Iin(ax, 0,0, bq25570buck_3V6_eff___1V8_Iout, param)
		plotEffPloss_Iin(ax, 0,0, bq25570buck_5V5_eff___1V8_Iout, param)
		plotEffPloss_Vin(ax, 1,0, bq25570buck_Vin_eff___1V8_10uA, param)
		plotEffPloss_Vin(ax, 1,0, bq25570buck_Vin_eff___1V8_100uA, param)
		plotEffPloss_Vin(ax, 1,0, bq25570buck_Vin_eff___1V8_10mA, param)


if not converter.endswith("export"):
	mng = plt.get_current_fig_manager()
	mng.window.wm_geometry("+1920+0")
	fig.set_size_inches([18,9.5], forward = True)

plt.show()




# for bq25570buck
'''
test = modelparam(
	LossConst = 1.2E-6,
	LossIin = 0.0,
	LossVin = 0.0,
	LossIinSqr = 0
)
'''

'''
# ORG
adp5090 = modelparam(
	LossIin = VoutM * 0.006,   # for 5V ADP5090 output: 0.065, # 68% @ 0.2V  - Abstand der Kurvenschaar generell
	LossVin = 0.11,      # schiebt max eff bei i sweep runter, bei Vsweep aber nicht so arg!!! :-)
	LossConst = VoutM**1.5 * 0.23E-6,  #  for 5V ADP5090 output:2.6E-6,   7E-7 für 2V SUPER!
	LossIinSqr = 2.0     # 2.5 für 2V SUPER!   - für hohe Iin	
)
test = modelparam(
	LossIin = 0.01923,
	LossVin = 0.0987,
	LossConst =  12E-7,
	LossIinSqr = 1.0
)'''