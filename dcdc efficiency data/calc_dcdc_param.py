from math import sqrt

#Input:
# Efficiency wrt. Iin current sweep with two different Vin:
vin1 = 1
eff1 = 0.85 #0.882
vin2 = 0.2
eff2 = 0.59#0.683

#iin = 1E-3
#calc Ploss divided by Iin as it cancels out
Ploss1_iin = (1-eff1)*vin1 #*iin
Ploss2_iin = (1-eff2)*vin2 #*iin

B = (Ploss1_iin - Ploss2_iin) / (sqrt(vin1) - sqrt(vin2))
A = Ploss1_iin - B*sqrt(vin1)

print(A)
print(B)
