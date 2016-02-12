%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Flap Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Simulation Data
simu=simulationClass();
simu.simMechanicsFile = 'FOSWEC_flapPitch.slx';
simu.rampT = 0;
simu.endTime = 25;
simu.dt = 0.025;
simu.mode = 'normal';
simu.explorer = 'on';
simu.domainSize = 2;
simu.CITime = 50;       %this is a numerical trick, CItime shouldnt be this long, check hydroData
simu.mcrCaseFile = 'flapDecayCase.mat';


%% Wave Information
waves = waveClass('noWaveCIC');


%% Body Data
ic = [-0.65 0 -0.5]; %ic of pitch rotation
try phi = mcr.cases(imcr,1); catch phi=0; end

%% Body 1: Platform
body(1) = bodyClass('../../../hydroData/Analysis.h5',1);                     
body(1).geometryFile = '../../../geometry/platform.stl';
body(1).mass = 153.8;   %[kg] from Hinsdale
body(1).momOfInertia = [37.88 29.63 66.2529];  %[kg-m^2] from Hinsdale - UPDATE Izz
body(1).viz.color = [1 1 1];
body(1).viz.opacity = 0.25;

%% Body 2: Front Flap
body(2) = bodyClass('../../../hydroData/Analysis.h5',2);                     
body(2).geometryFile = '../../../geometry/flap.stl';
body(2).mass = 23.1;      %[kg] from Hinsdale
body(2).momOfInertia = [1.42 1.19 1.99];  %[kg-m^2] from Hinsdale

body(2).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);
body(2).linearDamping(5) = 10;  
body(2).viscDrag.cd(5) = 8;  % see Babarit ref
body(2).viscDrag.characteristicArea(5) = 0.01429167;  %[m^2] h=0.5m w=0.7m 
% second momoent area - https://en.wikipedia.org/wiki/List_of_area_moments_of_inertia
% Iy = 1/12*w^3*h = -0.98571

%% Body 3: Back Flap
body(3) = bodyClass('../../../hydroData/Analysis.h5',3);                     
body(3).geometryFile = '../../../geometry/flap.stl';
body(3).mass = 23.1;      %[kg] from Hinsdale
body(3).momOfInertia = [1.58 1.62 1.25];  %[kg-m^2] from Hinsdale

%% Arm Mass Properties 
%% Body 4: Arm - Rectangle Frame (attached to FOSWEC)
body(4) = bodyClass('',[]);
body(4).nhBody = 1;
body(4).name = 'arm_rectangle';
body(4).mass = 47.7; %[kg] (from Pedro)
body(4).momOfInertia = [1.44 2.21 3.57]; %[kg-m^2]      %UPDATE THIS
body(4).cg = [0 0 -0.366]; %[m]                         %UPDATE THIS
body(4).dispVol = 0;
body(4).geometryFile = '../../../geometry/rectangle.stl';
body(4).viz.color = [1 0 0];
body(4).viz.opacity = 1;

%% Body 5: Arm - Pitching Squares
body(5) = bodyClass('',[]);
body(5).nhBody = 1;
body(5).name = 'arm_squares';
body(5).mass = 4.47;  %[kg]                             %UPDATE THIS
body(5).momOfInertia = [0.29, 0.02, 0.30]; %[kg-m^2]    %UPDATE THIS
body(5).cg = [0 0 -0.366]; %[m]                         %UPDATE THIS
body(5).dispVol = 0;
body(5).geometryFile = '../../../geometry/squares.stl';
body(5).viz.color = [0 1 0];
body(5).viz.opacity = 1;

%% Body 6: Arm - Heaving Cylinder
body(6) = bodyClass('',[]);
body(6).nhBody = 1;
body(6).name = 'arm_cylinder';
body(6).mass = 23.84;   %[kg] (from Pedro)
body(6).momOfInertia = [2.19 2.15 0.28]; %[kg-m^2]      %UPDATE THIS
body(6).cg = [0 0 -0.782]; %[m]                         %UPDATE THIS
body(6).dispVol = 0.009782;
body(6).geometryFile = '../../../geometry/cylinder.stl';
body(6).viz.color = [0 0 1];
body(6).viz.opacity = 1;

%% Body 7: Arm - Fixed Cylinder (attached to seafloor)
body(7) = bodyClass('',[]);
body(7).nhBody = 1;
body(7).name = 'arm_cylinderFixed';
body(7).mass = 1;
body(7).momOfInertia = [1 1 1];
body(7).cg = [0 0 -1.1];
body(7).dispVol = 1/1000;
body(7).initDisp.initLinDisp = [0 0 0];
body(7).initDisp.initAngularDispAxis = [0 1 0];
body(7).initDisp.initAngularDispAngle = 0;
body(7).geometryFile = '../../../geometry/cylinder_fixed.stl';
body(7).viz.color = [0 0 1];
body(7).viz.opacity = 0.25;


%% PTO and Constraint Parameters
%% Constraint 1
constraint(1)= constraintClass('arm_wec');
constraint(1).loc  = [0 0 -0.366];

%% Constraint 2
constraint(2)= constraintClass('arm_surge');
constraint(2).loc  = [0 0 -0.366];

%% Constraint 3
constraint(3)= constraintClass('arm_pitch');
constraint(3).loc = [0 0 -0.366];

%% Constraint 4
constraint(4)= constraintClass('arm_heave');
constraint(4).loc = [0 0 -1.36];

%% Constraint 5
constraint(5)= constraintClass('arm_floor');
constraint(5).loc = [0 0 -1.36];

%% PTO 1 - Pitch
constraint(6)= constraintClass('PTO_flap1');
constraint(6).loc = [-0.65 0 -0.5];

%% PTO 2 - Fixed
constraint(7)= constraintClass('PTO_flap2');
constraint(7).loc = [0.65 0 -0.5];

%%
clear ic phi init_loc
