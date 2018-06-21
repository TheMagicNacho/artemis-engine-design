//---NOTES---
// Dt = Density of Gas at Throat
// Acof = Area of Exhaust / Area of Throat
// Reff.  Development of Hydrogen Peroxide Monopropellant Rocket  by Cervone et al
// Reff. https://www.grc.nasa.gov/www/K-12/airplane/isentrop.html

//---VARIABLES---
h = 4093.638;  //Specific Heat (Kj/Mol) AKA Enthalpy
r = 3.852; //ratio of exhaust gases and their constant (function of molar weight) 3.852
tc = 3182.027; //Combustion Chamber Temp (K)
pc = 10; //Combustion Chamber Presure (bar)
vcc = 2; //Combustion Chamber Volume  (L)
f = 5; //thrust required
pa = 10; //ambiant presure
n = 23; //Number of moles from combustion product

//---CALCULATIONS---
//cstar = sqrt(r*tc / h * (h +1)/2**(h +1 / 2 * (h-1)));
cstar = 903.5;
pe = (n * 0.08205 / vcc) * tc;  //exhaust presure - assumes ideal gas constant

//throat
tt = tc * (2/h+1); //throat temp (K)
pt = pc * (2/h+1) ** (h/(h-1)); //presure (bar)
dt = pt / (r*tt);  //density
vt = sqrt(r*0.08205*tt); //Velocity at throat - assumes ideal gas constant
mt = vt / 295.26992;  // throat mach number - assumes speed of sound is 295.26992 at stratosphere
at = f / (mt * dt);

//coefficents
//aco  = (((2/(r+1)) * (1+ ((r-1)/2) * me^2))^((r+1)/2(r-1)))*(1/me) ;
aco = ((1 + m^2 * (r-1)/2)^((r+1)/(r-1)/2))*(((r+1)/2)**-((r+1)/(r-1)/2)) / m;

cf = h * sqrt(((2/h+1)^((h+1)/(h-1))) * (2/(h-1)) * (1-(pe /pc)^((h-1)/h))) + ((pe-pa)/pc) * aco; // DONT THINK I NEED THIS VARIABLE

//exhaust
ae = at * sqrt(aco); // area of exhaust diameter (MM)

te = tc / (1+((h-1)/2)*me^2);  //,Temp

de = pe / (r*te);  //desnsity

ve = cstar * cf; // exhaust velocity (m/s)

me = ve / 295.26992; // exhaust mach number - assumes speed of sound is 295.26992 at stratosphere

//finals
c = cf * cstar;

mdot = (pc * at) / cstar;

//print


disp("AREA THROAT {in mm}")
disp(at)

disp("AREA EXHAUST {in mm}")
disp(ae)

disp("MACH SPEED THROAT")
disp(mt)

disp("MACH SPEED EXHAUST")
disp(me)

disp("DELTA MACH")
disp(me-mt)

disp("MASS FLOW RATE")
disp(mdot)

