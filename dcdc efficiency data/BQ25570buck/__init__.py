import numpy as np
from numpy import genfromtxt
from collections import namedtuple
record = namedtuple("record", "Vin Iin Vout Iout Eff")


### BQ25570 buck Iout @ 1V8
data = genfromtxt('./BQ25570buck/2V1_eff___1V8_Iout.csv', delimiter=',');
bq25570buck_2V1_eff___1V8_Iout = record(
	Vin = 2.1,
	Iin = None,
	Vout = 1.8,
	Iout = data[:,0]/1000,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570buck/3V6_eff___1V8_Iout.csv', delimiter=',');
bq25570buck_3V6_eff___1V8_Iout = record(
	Vin = 3.6,
	Iin = None,
	Vout = 1.8,
	Iout = data[:,0]/1000,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570buck/5V5_eff___1V8_Iout.csv', delimiter=',');
bq25570buck_5V5_eff___1V8_Iout = record(
	Vin = 5.5,
	Iin = None,
	Vout = 1.8,
	Iout = data[:,0]/1000,
	Eff = data[:,1]/100
)


data = genfromtxt('./BQ25570buck/Vin_eff___1V8_10uA.csv', delimiter=',');
bq25570buck_Vin_eff___1V8_10uA = record(
	Vin = data[:,0],
	Iin = None,
	Vout = 1.8,
	Iout = 10E-6,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570buck/Vin_eff___1V8_100uA.csv', delimiter=',');
bq25570buck_Vin_eff___1V8_100uA = record(
	Vin = data[:,0],
	Iin = None,
	Vout = 1.8,
	Iout = 100E-6,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570buck/Vin_eff___1V8_1mA.csv', delimiter=',');
bq25570buck_Vin_eff___1V8_1mA = record(
	Vin = data[:,0],
	Iin = None,
	Vout = 1.8,
	Iout = 1E-3,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570buck/Vin_eff___1V8_10mA.csv', delimiter=',');
bq25570buck_Vin_eff___1V8_10mA = record(
	Vin = data[:,0],
	Iin = None,
	Vout = 1.8,
	Iout = 10E-3,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570buck/Vin_eff___1V8_100mA.csv', delimiter=',');
bq25570buck_Vin_eff___1V8_100mA = record(
	Vin = data[:,0],
	Iin = None,
	Vout = 1.8,
	Iout = 100E-3,
	Eff = data[:,1]/100
)
