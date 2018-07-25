tstep = 1; //sec
tfinal = 82;//sec
// Constants --------------------------
T = 1650245.73705;//Thrust in N
mdot = 592.64056;//mass flow is considered constant (kg/s);
Re = 6378135;//Radius of earth in meters;
ge = 9.81;//gravity g;


//let
Z0 = tan(beta / 2);

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Initial Conditions
mnot = 136077.711;//total mass in kg
gammanot = (89.9975*%pi)/180;//gamma must be in radians;
Vnot = 134.112;//Initial velocity 300 mph, but in meters/sec:
Hnot = 6096;//Initial Altitude... 20kft...in meters
Xnot = 0;//Initial X position

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y0 = [mnot,Hnot,Xnot,Vnot,gammanot];
// Integrate the equations of motion
// !! L.27: Matlab function odeset not yet converted, original calling sequence used.
odeoptions ("RelTol",0.0000001,"AbsTol",0.0000000001*ones(1,5));

// !! L.28: Unknown function ODE45 not converted, original calling sequence used.
[t,y] = ODE45("launcheoms",0:tstep:tfinal,y0,options);

out = [y(mtlb(mtlb(:)),2),y(mtlb(mtlb(:)),3),y(mtlb(mtlb(:)),4),y(mtlb(mtlb(:)),5)];
// L.30: No simple equivalent, so mtlb_fprintf() is called.
//mtlb_fprintf(file,"%2.8e \t %2.8e \t %2.8e \t %2.8e \n",mtlb_t(out));
//fprintf(file,''%2.8e \t %2.8e \t %2.8e \t %2.8e \t %2.8e \n'',y'');
mclose(file);
