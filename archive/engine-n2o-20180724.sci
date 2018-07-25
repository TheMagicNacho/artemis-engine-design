//---NOTES---
// Dt = Density of Gas at Throat
// Acof = Area of Exhaust / Area of Throat
// Reff.  Development of Hydrogen Peroxide Monopropellant Rocket  by Cervone et al
// Reff. https://www.grc.nasa.gov/www/K-12/airplane/isentrop.html
// assumes an hydrogen peroxide & heximine combustion

//---VARIABLES---
h = 4686.79;  //Specific Heat (Kj/Mol) AKA Enthalpy
tc = 673.504; //Combustion Chamber Temp (K) - derived from abdatic 
pc = 25; //Combustion Chamber Presure (bar) - based on research from S. Krishnan1*, Ahn Sang-Hee2, Lee Choong-Won2
vcc = 2; //Combustion Chamber Volume  (L) - guessed size of rocket
f = 1961.33; // in N
pa = 10; //ambiant presure - estimated combustion of 
n = 230; //Number of moles from combustion product

//---CALCULATIONS---
cstar = 903.5; //constant of compressability
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

//isp = ve / 9.80665; // specific impulse - asume gravity 9.8 m/s
isp = (mdot*9.80665)/1961.33


tsum = tt + tc; // sum of temp to find average
tavg = tsum / 2; // avg temp

//print
disp("!!G I V E N S!!")
disp("Specific Heat {Kj/Mol}")
disp(h)
disp("Combustion Chamber Temp {K}}")
disp(tc)

disp("-----")
disp("!!E S T I M A T E D!!")
disp("Combustion Chamber Presure {bar}")
disp(pc)
disp("Combustion Chamber Volume  {L}")
disp(vcc)
disp("Ambiant Pressures {bar}")
disp(pa)

disp("-----")
disp("!!C A L C U L A T E D!!")
disp("AREA THROAT {mm}")
disp(at)
disp("PRESSURE EXHAUST {bar}")
disp(pe)
disp("AREA EXHAUST {mm}")
disp(ae)
disp("MACH SPEED THROAT")
disp(mt)
disp("EXHAUST VELOCITY {m/sec}")
disp(ve)
disp("MACH SPEED EXHAUST")
disp(me)
disp("MASS FLOW RATE {kg/s}")
disp(mdot)

disp("SPECIFIC IMPULSE {sec}")
disp(isp)
disp("AVG. OPERATING TEMPS {K}")
disp(tavg)

