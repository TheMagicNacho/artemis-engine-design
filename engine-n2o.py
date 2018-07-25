#---NOTES---
# Dt = Density of Gas at Throat
# Acof = Area of Exhaust / Area of Throat
# Reff.  Development of Hydrogen Peroxide Monopropellant Rocket  by Cervone et al
# Reff. https:#www.grc.nasa.gov/www/K-12/airplane/isentrop.html
# assumes an nitrous oxide & heximine combustion

import math
import cmath

#User Defined Variables
H = 4686.79  #Specific Heat (Kj/Mol) AKA Enthalpy
Tc = 673.504 #Combustion Chamber Temp (K) - derived from abdatic
Pc = 25 #Combustion Chamber Presure (bar) - based on research from S. Krishnan1*, Ahn Sang-Hee2, Lee Choong-Won2
vcc = 2 #Combustion Chamber Volume  (L) - guessed size of rocket
payload = 2 # in kg
Pa = 10 #ambiant presure - estimated combustion of
n = 230 #Number of moles from combustion product

#Initial Calculations
cstar = 903.5 #constant of compressability
Pe = (n * 0.08205 / vcc) * Tc  #exhaust presure - assumes ideal gas constant
r = H / (Tc+258) #specific heat ratio
Fr = (payload * 20) * ( 76000.00 + 9.80665) # force required in Newtons

#Throat
Tt = Tc * (2/H+1) #throat temp (K)
Pt = Pc * (2/H+1) ** (H/(H-1)) #presure (bar)
Dt = Pt / (r*Tt)  #density
Vt = math.sqrt(r*0.08205*Tt) #Velocity at throat - assumes ideal gas constant
mt = Vt / 295.26992  # throat mach number - assumes speed of sound is 295.26992 at stratosphere
At = payload / (mt * Dt)

#coefficents

Aco = (math.pow (1 + mt**2 * (r-1)/2,((r+1)/(r-1)/2)) * math.pow ((r+1)/2, -((r+1)/(r-1)/2))) / mt

#t = Vt * mdot;


#exhaust
Ae = At * math.sqrt(Aco) # area of exhaust diameter (MM)
Te = Tc / (1+((H-1)/2)*Vt**2)  #exhaust Temp in k
De = Pe / (r*Te)  #desnsity
#cf = cmath.sqrt( ((2 * 1.66 ** 2) / (1.66-1)) * math.pow((2 / 1.66 + 1), (1.66+1 / 1.66-1)) * (1 - math.pow (Pe-Pc, (1.66-1 / 1.66))) ) + (Pe + Pa) * Ae
#cf = H*cmath.sqrt( math.pow(2/H+1, (H+1)/(H-1))*(2/(H-1))*math.pow(1-(Pe/Pc),((H-1)/H)))+((Pe-Pa)/Pc)*Aco #thrust coifficent
cf = Fr / At * Pc# thrust coifficent


#final
Ve = math.sqrt(cf * cstar) #velocity at exit
mdot = (Pc * At) / cstar #mass flow rate
Ve = math.sqrt(cf * cstar) #velocity at exit
Me = Ve / 295.26992; # exhaust mach number - assumes speed of sound is 295.26992 at stratosphere
isp = Ve / 9.80665 #specific impulse - asume gravity 9.8 m/s
#isp = (mdot*9.80665) / 1961.33
Tsum = Tt + Tc #sum of temp to find average
Tavg = Tsum / 2 # avg temp



# PRINT IT
print("")
print("-------ENGINE CALCULATIONS-------")
print("USER DEFINED VARIABLES")
print "Specific Heat:", H
print "Combustion Chamber Tem (k):", Tc
print "Combustion Chamber Pressure (bar):", Pc
print "Combustion Chamber Volume (l):", vcc
print "Ambiant Pressure (bar):", Pa
print("--------------")
print ("ENGINE DESIGNS")
print "Diameter of Throat (mm)", At
print "Diameter of Exit (mm)", Ae
print("--------------")
print("THEORETICAL SPECS")
print "Average Operating Temps (k)", Tavg
print("")
print "Throat Velocity (m/s):", Vt
print "Exit Velocity (m/s):", Ve
print "Exit Mach:", Me
print ("")
print "Mass Flow Rate (kg/s)", mdot
print "Specific Impulse (sec)", isp
