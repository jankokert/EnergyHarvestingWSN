import numpy as np
from numpy import genfromtxt
from collections import namedtuple
record = namedtuple("record", "Vin Iin Vout Iout Eff")


### BQ25570 boost Iin @ 0V2
data = genfromtxt('./BQ25570boost/0V2_Iin___2V0_eff.csv', delimiter=',');
bq25570boost_0V2_Iin___2V0_eff = record(
	Vin = 0.2,
	Iin = data[:,0]/1000,
	Vout = 2.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/0V2_Iin___3V0_eff.csv', delimiter=',');
bq25570boost_0V2_Iin___3V0_eff = record(
	Vin = 0.2,
	Iin = data[:,0]/1000,
	Vout = 3.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/0V2_Iin___5V5_eff.csv', delimiter=',');
bq25570boost_0V2_Iin___5V5_eff = record(
	Vin = 0.2,
	Iin = data[:,0]/1000,
	Vout = 5.5,
	Iout = None,
	Eff = data[:,1]/100
)


### BQ25570 boost Iin @ 1V0
data = genfromtxt('./BQ25570boost/1V0_Iin___2V0_eff.csv', delimiter=',');
bq25570boost_1V0_Iin___2V0_eff = record(
	Vin = 1.0,
	Iin = data[:,0]/1000,
	Vout = 2.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/1V0_Iin___3V0_eff.csv', delimiter=',');
bq25570boost_1V0_Iin___3V0_eff = record(
	Vin = 1.0,
	Iin = data[:,0]/1000,
	Vout = 3.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/1V0_Iin___5V5_eff.csv', delimiter=',');
bq25570boost_1V0_Iin___5V5_eff = record(
	Vin = 1.0,
	Iin = data[:,0]/1000,
	Vout = 5.5,
	Iout = None,
	Eff = data[:,1]/100
)


data = genfromtxt('./BQ25570boost/Vin_10uA___2V0_eff.csv', delimiter=',');
bq25570boost_Vin_10uA___2V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-6,
	Vout = 2.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/Vin_10uA___3V0_eff.csv', delimiter=',');
bq25570boost_Vin_10uA___3V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-6,
	Vout = 3.0,
	Iout = None,
	Eff = data[:,1]/100
)


data = genfromtxt('./BQ25570boost/Vin_100uA___2V0_eff.csv', delimiter=',');
bq25570boost_Vin_100uA___2V0_eff = record(
	Vin = data[:,0],
	Iin = 100E-6,
	Vout = 2.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/Vin_100uA___3V0_eff.csv', delimiter=',');
bq25570boost_Vin_100uA___3V0_eff = record(
	Vin = data[:,0],
	Iin = 100E-6,
	Vout = 3.0,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./BQ25570boost/Vin_100uA___5V5_eff.csv', delimiter=',');
bq25570boost_Vin_100uA___5V5_eff = record(
	Vin = data[:,0],
	Iin = 100E-6,
	Vout = 5.5,
	Iout = None,
	Eff = data[:,1]/100
)