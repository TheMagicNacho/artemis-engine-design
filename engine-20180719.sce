//---NOTES---
// Dt = Density of Gas at Throat
// Acof = Area of Exhaust / Area of Throat
 
//---VARIABLES---
h = -4093.638;  //Specific Heat (Kj/Mol) AKA Enthalpy
r= 3.852;  //ratio of exhaust gases and their constant (function of molar weight)
tc= 3182.027; //Combustion Chamber Temp (K)
pc = 10; //Combustion Chamber Presure (bar)
vcc = 2; //Combustion Chamber Volume (L)
f = 32323; //thrust required
pa = 10; //ambiant presure
n = 23; //Number of moles from combustion product

//---CALCULATIONS---
cstar = sqrt(r*tc / h * (h +1)/2**(h +1 / 2 * (h-1)));
pe = (n * 0.08205 / vcc) * tc;  //exhaust presure - assumes ideal gas constant
//throat
tt = tc * (2/h+1); //temp
pt = pc * (2/h+1) ** (h/(h-1)); //presure
dt = pt / (r*tt);  //density
vt = sqrt(h*r*tt); //Velocity
//exhaust
me = sqrt((2 / h-1) * ((pc/pe)^((h-1)/h) /1) );  //Mach Number 
te = tc / (1+((h-1)/2)*me^2);  //Temp
de = pe / (r*te);  //desnsity
//coefficents
aco = (1/me) * (2/(h+1)) * (1+ ((h-1)/2) * me^2)^((h+1)/2(h-1));
cf = h * sqrt(((2/h+1)^((h+1)/(h-1))) * (2/(h-1)) * (1-(pe /pc)^((h-1)/h)) + ((pe-pa)/pc) * aco);
//finals
c = cf * cstar;
at = f/(cf * pc);
mdot = (pc * at) / cstar;

//---PRINT---
