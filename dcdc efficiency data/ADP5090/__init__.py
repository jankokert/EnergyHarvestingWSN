import numpy as np
from numpy import genfromtxt
from collections import namedtuple
record = namedtuple("record", "Vin Iin Vout Iout Eff")


### ADP5090 Vin @ 2V
data = genfromtxt('./ADP5090/Vin_10uA___2V0_eff.csv', delimiter=',');	
adp5090_Vin_10uA___2V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-6,  # constant current = 10 µA
	Vout = 2,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/Vin_100uA___2V0_eff.csv', delimiter=',');	
adp5090_Vin_100uA___2V0_eff = record(
	Vin = data[:,0],
	Iin = 100E-6,  # constant current = 100 µA
	Vout = 2,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/Vin_10mA___2V0_eff.csv', delimiter=',');	
adp5090_Vin_10mA___2V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-3,  # constant current = 10 mA
	Vout = 2,
	Iout = None,
	Eff = data[:,1]/100
)


### ADP5090 Vin @ 3V
data = genfromtxt('./ADP5090/Vin_10uA___3V0_eff.csv', delimiter=',');	
adp5090_Vin_10uA___3V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-6,  # constant current = 10 µA
	Vout = 3,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/Vin_100uA___3V0_eff.csv', delimiter=',');	
adp5090_Vin_100uA___3V0_eff = record(
	Vin = data[:,0],
	Iin = 100E-6,  # constant current = 100 µA
	Vout = 3,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/Vin_10mA___3V0_eff.csv', delimiter=',');	
adp5090_Vin_10mA___3V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-3,  # constant current = 10 mA
	Vout = 3,
	Iout = None,
	Eff = data[:,1]/100
)

### ADP5090 Vin @ 5V
data = genfromtxt('./ADP5090/Vin_10uA___5V0_eff.csv', delimiter=',');	
adp5090_Vin_10uA___5V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-6,  # constant current = 10 µA
	Vout = 5,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/Vin_100uA___5V0_eff.csv', delimiter=',');	
adp5090_Vin_100uA___5V0_eff = record(
	Vin = data[:,0],
	Iin = 100E-6,  # constant current = 100 µA
	Vout = 5,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/Vin_10mA___5V0_eff.csv', delimiter=',');	
adp5090_Vin_10mA___5V0_eff = record(
	Vin = data[:,0],
	Iin = 10E-3,  # constant current = 10 mA
	Vout = 5,
	Iout = None,
	Eff = data[:,1]/100
)


### ADP5090 Iin @ 2V
data = genfromtxt('./ADP5090/0V2_Iin___2V0_eff.csv', delimiter=',');
adp5090_0V2_Iin___2V0_eff = record(
	Vin = 0.2,
	Iin = data[:,0]/1000,
	Vout = 2,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/0V5_Iin___2V0_eff.csv', delimiter=',');
adp5090_0V5_Iin___2V0_eff = record(
	Vin = 0.5,
	Iin = data[:,0]/1000,
	Vout = 2,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/1V0_Iin___2V0_eff.csv', delimiter=',');
adp5090_1V0_Iin___2V0_eff = record(
	Vin = 1.0,
	Iin = data[:,0]/1000,
	Vout = 2,
	Iout = None,
	Eff = data[:,1]/100
)


### ADP5090 Iin @ 3V
data = genfromtxt('./ADP5090/0V2_Iin___3V0_eff.csv', delimiter=',');
adp5090_0V2_Iin___3V0_eff = record(
	Vin = 0.2,
	Iin = data[:,0]/1000,
	Vout = 3,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/0V5_Iin___3V0_eff.csv', delimiter=',');
adp5090_0V5_Iin___3V0_eff = record(
	Vin = 0.5,
	Iin = data[:,0]/1000,
	Vout = 3,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/1V0_Iin___3V0_eff.csv', delimiter=',');
adp5090_1V0_Iin___3V0_eff = record(
	Vin = 1.0,
	Iin = data[:,0]/1000,
	Vout = 3,
	Iout = None,
	Eff = data[:,1]/100
)


### ADP5090 Iin @ 5V
data = genfromtxt('./ADP5090/0V2_Iin___5V0_eff.csv', delimiter=',');
adp5090_0V2_Iin___5V0_eff = record(
	Vin = 0.2,
	Iin = data[:,0]/1000,
	Vout = 5,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/0V5_Iin___5V0_eff.csv', delimiter=',');
adp5090_0V5_Iin___5V0_eff = record(
	Vin = 0.5,
	Iin = data[:,0]/1000,
	Vout = 5,
	Iout = None,
	Eff = data[:,1]/100
)
data = genfromtxt('./ADP5090/1V0_Iin___5V0_eff.csv', delimiter=',');
adp5090_1V0_Iin___5V0_eff = record(
	Vin = 1.0,
	Iin = data[:,0]/1000,
	Vout = 5,
	Iout = None,
	Eff = data[:,1]/100
)
