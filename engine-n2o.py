#---NOTES---
# Dt = Density of Gas at Throat
# Acof = Area of Exhaust / Area of Throat
# Reff.  Development of Hydrogen Peroxide Monopropellant Rocket  by Cervone et al
# Reff. https:#www.grc.nasa.gov/www/K-12/airplane/isentrop.html
# assumes an nitrous oxide & heximine combustion

import math
import cmath

#User Defined Variables
h = 4686.79  #Specific Heat (Kj/Mol) AKA Enthalpy
tc = 673.504 #Combustion Chamber Temp (K) - derived from abdatic
pc = 25 #Combustion Chamber Presure (bar) - based on research from S. Krishnan1*, Ahn Sang-Hee2, Lee Choong-Won2
vcc = 2 #Combustion Chamber Volume  (L) - guessed size of rocket
payload = 2 # in kg
pa = 10 #ambiant presure - estimated combustion of
n = 230 #Number of moles from combustion product

#Initial Calculations
cstar = 903.5 #constant of compressability
pe = (n * 0.08205 / vcc) * tc  #exhaust presure - assumes ideal gas constant
r = h / (tc+258) #specific heat ratio
fr = (payload * 20) * ( 76000.00 + 9.80665) # force required in Newtons

#Throat
tt = tc * (2/h+1) #throat temp (K)
pt = pc * (2/h+1) ** (h/(h-1)) #presure (bar)
dt = pt / (r*tt)  #density
vt = math.sqrt(r*0.08205*tt) #Velocity at throat - assumes ideal gas constant
mt = vt / 295.26992  # throat mach number - assumes speed of sound is 295.26992 at stratosphere
at = payload / (mt * dt)

#coefficents
aco = ((1 + mt**(2) * (r-1)/2)**(r+1)/(r-1)/2) * (((r+1)/2) ** -((r+1)/(r-1)/2)) / mt
#cf = h * math.sqrt( math.pow(2/h+1, (h+1)/(h-1)) / (h-1)) * (2/(h-1)) * math.pow(1-(pe /pc), (h-1))  + ((pe-pa)/pc) * aco # thrust coifficent
#t = vt * mdot;


#exhaust
ae = at * math.sqrt(aco) # area of exhaust diameter (MM)
te = tc / (1+((h-1)/2)*vt**2)  #Temp
de = pe / (r*te)  #desnsity
cf = cmath.sqrt( ((2 * 1.66 ** 2) / (1.66-1)) * math.pow((2 / 1.66 + 1), (1.66+1 / 1.66-1)) * (1 - math.pow (pe-pc, (1.66-1 / 1.66))) ) + (pe + pa) * ae

#finals
ve = cmath.sqrt(cf * cstar) #velocity at exit
mdot = (pc * at) / cstar #mass flow rate
ve = cmath.sqrt(cf * cstar) #velocity at exit
me = ve / 295.26992; # exhaust mach number - assumes speed of sound is 295.26992 at stratosphere
isp = ve / 9.80665 #specific impulse - asume gravity 9.8 m/s
#isp = (mdot*9.80665) / 1961.33
tsum = tt + tc #sum of temp to find average
tavg = tsum / 2 # avg temp



# PRINT IT
print("")
print("-------ENGINE CALCULATIONS-------")
print("USER DEFINED VARIABLES")
print "Specific Heat:", h
print "Combustion Chamber Tem (k):", tc
print "Combustion Chamber Pressure (bar):", pc
print "Combustion Chamber Volume (l):", vcc
print "Ambiant Pressure (bar):", pa
print("--------------")
print ("ENGINE DESIGNS")
print "Diameter of Throat (mm)", at
print "Diameter of Exit (mm)", ae
print("--------------")
print("THEORETICAL SPECS")
print "Throat Temp (k):", tt
print "Exhaust Temp (k):", te
print "Average Operating Temps (k)", tavg
print("")
print "Throat Velocity (m/s):", vt
print "Exit Velocity (m/s):", ve
print "Exit Mach:", me
print ("")
print "Mass Flow Rate (kg/s)", mdot
print "Specific Impulse (sec)", isp

print "ACO", aco
