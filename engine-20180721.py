# ---NOTES---
# Dt = Density of Gas at Throat
#  Acof = Area of Exhaust / Area of Throat
#  Reff.  Development of Hydrogen Peroxide Monopropellant Rocket  by Cervone et al
import math

#---DEFINE VARIABLES---
#Specific Heat (Kj/Mol) AKA Enthalpy
h = -4093.638
#ratio of exhaust gases and their constant (function of molar weight)3.852
r = 3.852
#Combustion Chamber Temp (K)
tc = 3182.027
#Combustion Chamber Presure (bar)
pc = 10
#Combustion Chamber Volume (L)
vcc = 2
#thrust required (N)
f = 5
#ambiant presure (BAR)
pa = 10
#Number of moles from combustion product
n = 23


#---CALCULATE---
#Specific heat ratio (Might be 903.5)
cstar = math.sqrt(r*tc / h * (h +1.0)/2.0**(h +1.0 / 2.0 * (h-1.0)))


#THRUST CALCULATE

#RATIO & COEFFICENTS

#EXHAUST CALCULATE

#---OUTPUTS---


#---PRINT--- mdot / mach number / impulse / throat diamiter / givens
print(cstar)
