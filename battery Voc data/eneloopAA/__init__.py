import numpy as np
from numpy import genfromtxt
from collections import namedtuple
record = namedtuple("record", "Vout Qout Iout")

### eneloop discharge
data = genfromtxt('./eneloopAA/Discharge_0A4.csv', delimiter=',');
eneloopAA_0A2 = record(
	Qout = data[:,0],
	Vout = data[:,1],
	Iout = 0.4,
)

data = genfromtxt('./eneloopAA/Discharge_1A0.csv', delimiter=',');
eneloopAA_1A0 = record(#
	Qout = data[:,0],
	Vout = data[:,1],
	Iout = 1.0,
)

data = genfromtxt('./eneloopAA/Discharge_2A0.csv', delimiter=',');
eneloopAA_2A0 = record(
	Qout = data[:,0],
	Vout = data[:,1],
	Iout = 2.0,
)
