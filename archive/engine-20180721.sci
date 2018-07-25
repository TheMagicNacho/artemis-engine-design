//---NOTES---
// Dt = Density of Gas at Throat
// Acof = Area of Exhaust / Area of Throat
// Reff.  Development of Hydrogen Peroxide Monopropellant Rocket  by Cervone et al
// Reff. https://www.grc.nasa.gov/www/K-12/airplane/isentrop.html
// assumes an hydrogen peroxide & heximine combustion

//---VARIABLES---
h = 4093.638;  //Specific Heat (Kj/Mol) AKA Enthalpy
tc = 3182.027; //Combustion Chamber Temp (K) - derived from abdatic 
pc = 25; //Combustion Chamber Presure (bar) - based on research from S. Krishnan1*, Ahn Sang-Hee2, Lee Choong-Won2
vcc = 2; //Combustion Chamber Volume  (L)
f = 2; //thrust required (N)
pa = 10; //ambiant presure
n = 230; //Number of moles from combustion product

//---CALCULATIONS---
cstar = 903.5;
pe = (n * 0.08205 / vcc) * tc;  //exhaust presure - assumes ideal gas constant
r = h / (tc+258); //specific heat ratio

//throat
tt = tc * (2/h+1); //throat temp (K)
pt = pc * (2/h+1) ** (h/(h-1)); //presure (bar)
dt = pt / (r*tt);  //density
vt = sqrt(r*0.08205*tt); //Velocity at throat - assumes ideal gas constant
mt = vt / 295.26992;  // throat mach number - assumes speed of sound is 295.26992 at stratosphere
at = f / (mt * dt);

//coefficents
aco = ((1 + mt^2 * (r-1)/2)^((r+1)/(r-1)/2))*(((r+1)/2)**-((r+1)/(r-1)/2)) / mt;
cf = h * sqrt(((2/h+1)^((h+1)/(h-1))) * (2/(h-1)) * (1-(pe /pc)^((h-1)/h))) + ((pe-pa)/pc) * aco; // thrust coifficent
//t = vt * mdot;

//exhaust
ae = at * sqrt(aco); // area of exhaust diameter (MM)
te = tc / (1+((h-1)/2)*vt^2);  //Temp
de = pe / (r*te);  //desnsity


//finals
ve = sqrt(cf * cstar);
mdot = (pc * at) / cstar;


me = ve / 295.26992; // exhaust mach number - assumes speed of sound is 295.26992 at stratosphere

isp = ve / 9.80665; // specific impulse - asume gravity 9.8 m/s

tsum = tt + tc; // find average tempurature
tavg = tsum / 2;

//print
disp("AREA THROAT {in mm}")
disp(at)
disp("AREA EXHAUST {in mm}")
disp(ae)
disp("MACH SPEED THROAT {calculated}")
disp(mt)

disp("MACH SPEED EXHAUST")
disp(me)

disp("MASS FLOW RATE {kg/s}")
disp(mdot)
disp("ESTIMATED SPECIFIC IMPULSE {s/kg}")
disp(isp)

disp("ESTIMATED OPERATING TEMPS {K}")
disp(tavg)

