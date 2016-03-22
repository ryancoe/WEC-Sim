%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Heave Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Simulation Data
simu=simulationClass();
simu.simMechanicsFile = 'FOSWEC_Heave.slx';
simu.rampT = 0;
simu.endTime = 10;
simu.dt = 0.05;
simu.mode = 'normal';
simu.explorer = 'on';
simu.domainSize = 2;
simu.CITime = 10;
simu.mcrCaseFile = 'heaveDecayCase.mat';
simu.nlHydro = 1;


%% Wave Information
waves = waveClass('noWaveCIC');

%% Body Data
%% Body 1: Back Flap
body(1) = bodyClass('../../hydroData/Analysis.h5');                     
body(1).geometryFile = '../../geometry/flap.stl';
body(1).mass = 23.1;      %[kg] from Hinsdale
body(1).momOfInertia = [1.58 1.62 1.25];  %[kg-m^2] from Hinsdale

%% Body 2: Front Flap
body(2) = bodyClass('../../hydroData/Analysis.h5');                     
body(2).geometryFile = '../../geometry/flap.stl';
body(2).mass = 23.1;      %[kg] from Hinsdale
body(2).momOfInertia = [1.42 1.19 1.99];  %[kg-m^2] from Hinsdale

%% Body 3: Platform
body(3) = bodyClass('../../hydroData/Analysis.h5');                     
body(3).geometryFile = '../../geometry/platform.stl';
body(3).mass = 153.8;   %[kg] from Hinsdale
body(3).momOfInertia = [37.88 29.63 66.2529];  %[kg-m^2] from Hinsdale - UPDATE Izz
body(3).viz.color = [1 1 1];
body(3).viz.opacity = 0.25;

body(3).viscDrag.cd(3) = 1.28;                  %flat plate
body(3).viscDrag.characteristicArea(3) = 0.5; %[m^2] 1.3*.89-1.2*076 = 0.245
body(3).linearDamping(3) = 800;  



%% Arm Mass Properties 
%% Body 4: Arm - Rectangle Frame (attached to FOSWEC)
body(4) = bodyClass('');
body(4).nhBody = 1;
body(4).name = 'arm_rectangle';
body(4).mass = 47.7; %[kg] (from Pedro)
body(4).momOfInertia = [1.44 2.21 3.57]; %[kg-m^2]      %UPDATE THIS
body(4).cg = [0 0 -0.366]; %[m]                         %UPDATE THIS
body(4).dispVol = 0;
body(4).geometryFile = '../../geometry/rectangle.stl';
body(4).viz.color = [1 0 0];
body(4).viz.opacity = 1;
    
%% Body 5: Arm - Pitching Squares
body(5) = bodyClass('');
body(5).nhBody = 1;
body(5).name = 'arm_squares';
body(5).mass = 4.47;  %[kg]                             %UPDATE THIS
body(5).momOfInertia = [0.29, 0.02, 0.30]; %[kg-m^2]    %UPDATE THIS
body(5).cg = [0 0 -0.366]; %[m]                         %UPDATE THIS
body(5).dispVol = 0;
body(5).geometryFile = '../../geometry/squares.stl';
body(5).viz.color = [0 1 0];
body(5).viz.opacity = 1;
    
%% Body 6: Arm - Heaving Cylinder
body(6) = bodyClass('');
body(6).nhBody = 1;
body(6).name = 'arm_cylinder';
body(6).mass = 23.84;   %[kg] (from Pedro)
body(6).momOfInertia = [2.19 2.15 0.28]; %[kg-m^2]      %UPDATE THIS
body(6).cg = [0 0 -0.782]; %[m]                         %UPDATE THIS
body(6).dispVol = 0.009782;
body(6).geometryFile = '../../geometry/cylinder.stl';
body(6).viz.color = [0 0 1];
body(6).viz.opacity = 1;

%% Body 7: Arm - Fixed Cylinder (attached to seafloor)
body(7) = bodyClass('');
body(7).nhBody = 1;
body(7).name = 'arm_cylinderFixed';
body(7).mass = 1;
body(7).momOfInertia = [1 1 1];
body(7).cg = [0 0 -1.1];
body(7).dispVol = 1/1000;
body(7).geometryFile = '../../geometry/cylinder_fixed.stl';
body(7).viz.color = [0 0 1];
body(7).viz.opacity = 0.25;


%% PVC Pipes (ignore caps) %% GUESSTIMATES
r = (4.5/2)*0.0254; % PVC outer diameter. 4" PVC pipe => OD 4.5"
w = 0.57; % Positive Y-coordinate of cg of pipes
t = -0.215; % Z-coordinate of cg of top pipes
b = t-2*r; % Z-coordinate of cg of bottom pipes
l = 1.350; % PVC Length
m = 15.568/4; % single PVC pipe mass
moi = [0.00001 0.00001 0.00001]; % single PVC pipe moment of  inertia
c = (58.989 - 4*pi*r^2*l)/(simu.rho*4); % extra Volume from caps

%% Body 8: PVC - Top+
body(8) = bodyClass('');
body(8).nhBody = 1;
body(8).name = 'pvc_tp';
body(8).mass = m;
body(8).momOfInertia = moi; 
body(8).cg = [0 w t];
body(8).dispVol = pi*r^2*l + c;
body(8).geometryFile = '../../geometry/pvc.stl';
body(8).viz.color = [1 1 1];
body(8).viz.opacity = 1;

%% Body 9: PVC - Bottom+
body(9) = bodyClass('');
body(9).nhBody = 1;
body(9).name = 'pvc_bp';
body(9).mass = m;
body(9).momOfInertia = moi; 
body(9).cg = [0 w b];
body(9).dispVol = pi*r^2*l + c;
body(9).geometryFile = '../../geometry/pvc.stl';
body(9).viz.color = [1 1 1];
body(9).viz.opacity = 1;

%% Body 10: PVC - Top-
body(10) = bodyClass('');
body(10).nhBody = 1;
body(10).name = 'pvc_tm';
body(10).mass = m;
body(10).momOfInertia = moi; 
body(10).cg = [0 -w t];
body(10).dispVol = pi*r^2*l + c;
body(10).geometryFile = '../../geometry/pvc.stl';
body(10).viz.color = [1 1 1];
body(10).viz.opacity = 1;

%% Body 11: PVC - Bottom-
body(11) = bodyClass('');
body(11).nhBody = 1;
body(11).name = 'pvc_bm';
body(11).mass = m;
body(11).momOfInertia = moi; 
body(11).cg = [0 -w b];
body(11).dispVol = pi * r^2 * l + c;
body(11).geometryFile = '../../geometry/pvc.stl';
body(11).viz.color = [1 1 1];
body(11).viz.opacity = 1;


%% Constraint and PTO Parameters
%% Constraint 1
constraint(1)= constraintClass('rectangle_fixed');
constraint(1).loc = [0 0 -0.5];

%% Constraint 2
constraint(2)= constraintClass('arm_surge');
constraint(2).loc = [0 0 -0.5];
% constraint(2).mooring.k(1,1) = 100;

%% Constraint 3
constraint(3)= constraintClass('arm_pitch');
constraint(3).loc = [0 0 -0.5];

%% Constraint 4
constraint(4)= constraintClass('arm_heave');
constraint(4).loc = [0 0 -0.75];

%% Constraint 5
constraint(5)= constraintClass('arm_floor');
constraint(5).loc = [0 0 -1];

%% PTO 1 - Fixed
constraint(6)= constraintClass('PTO_flap1');
constraint(6).loc = [-0.65 0 -0.5];

%% PTO 2 - Fixed
constraint(7)= constraintClass('PTO_flap2');
constraint(7).loc = [ 0.65 0 -0.5];

%% PVC- - Fixed
constraint(8)= constraintClass('PTO_flap2');
constraint(8).loc = [ 0 0 0];

%% PVC+ - Fixed
constraint(9)= constraintClass('PTO_flap2');
constraint(9).loc = [ 0 0 0];



body(1).initDisp.initLinDisp(3) = 0.1;
body(2).initDisp.initLinDisp(3) = 0.1;
body(3).initDisp.initLinDisp(3) = 0.1;
body(4).initDisp.initLinDisp(3) = 0.1;
body(5).initDisp.initLinDisp(3) = 0.1;
body(6).initDisp.initLinDisp(3) = 0.1;
body(8).initDisp.initLinDisp(3) = 0.1;
body(9).initDisp.initLinDisp(3) = 0.1;
body(10).initDisp.initLinDisp(3) = 0.1;
body(11).initDisp.initLinDisp(3) = 0.1;


































































