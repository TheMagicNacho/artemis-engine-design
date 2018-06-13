//NOTES
// Dt = Density of Gas at Throat
// Acof = Area of Exhaust / Area of Throat

//GIVENs
h = 3;  //Specific Heat
r= ?;  //ratio of exhaust gases and their constant(function of molar weight)
tc= ?; //Combustion Chamber Temp
pc = ?; //Combustion Chamber Presure
pe = ?;  //exhaust
f = 32323 //thrust required
pa = ?; //ambiant presure

//CALCULATIONS
cstar = sqrt(r*tc / h * (h +1)/2**(h +1 / 2 * (h-1)));

//throat
tt = tc * (2/H+1); //temp
pt = pc * (2/H+1) ** (H/(H-1)); //presure
dt = pt / (r*tt);  //density
vt = sqrt(h*r*tt); //Velocity

//exhaust
me = sqrt((2 / h-1) * ((pc/pe)^((h-1)/h) /1) );  //Mach Number 
te = tc / (1+((h-1)/2)*me^2);  //Temp
de = pe / (r*te);  //desnsity

//coefficents
acof = (1/me) * ((2/(h+1) * (1+ ((h-1)/2) * me^2)^(h+1)/2(h-1);
cf = h * sqrt(((2/h+1)^((h+1)/(h-1))) * (2/(h-1)) * (1-(pe /pc)^((h-1)/h)) + ((pe-pa)/pc) * acof);

//finals
c = cf * cstar;
at = f/(cf * pc);
mdot = (pc * at) / cstar;

//PRINT
