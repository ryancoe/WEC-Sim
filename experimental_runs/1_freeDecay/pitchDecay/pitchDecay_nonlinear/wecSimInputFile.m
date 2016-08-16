%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Pitch Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Simulation Data
simu=simulationClass();
simu.simMechanicsFile = 'FOSWEC_Pitch.slx';
simu.rampT = 0;
simu.endTime = 10;
simu.dt = 0.05;
simu.nlHydro = 1;
simu.mode = 'normal';
simu.explorer = 'on';
simu.domainSize = 2;
simu.CITime = 10;
simu.mcrCaseFile = 'pitchDecayCase.mat';

%% Wave Information
waves = waveClass('noWaveCIC');

%% Body Data
ic = [0 0 -0.366]; 
try phi = mcr.cases(imcr,1); catch phi=0; end
%% Body 1: Back Flap
body(1) = bodyClass('../../../hydroData/Analysis.h5');                     
body(1).geometryFile = '../../../geometry/flap.stl';
body(1).mass = 23.19;                       %[kg] from Exp
body(1).momOfInertia = [1.58 1.62 1.25];    %[kg-m^2] from Exp
body(1).viscDrag.cd(1) = 1.28;              % from surge decay
body(1).viscDrag.characteristicArea(1) = 0.5; %0.402424;  %[m^2] from surge decay
body(1).viscDrag.cd(5) = 8;                 % see Babarit ref
body(1).viscDrag.characteristicArea(5) = 0.0062;  %[m^2]
% Second Momoent Area - Iyy = w*h^3/12
% https://en.wikipedia.org/wiki/List_of_area_moments_of_inertia

body(1).cg = [0.65 0.0 -0.338];             %[m] for setInitDisp
body(1).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Body 2: Front Flap
body(2) = bodyClass('../../../hydroData/Analysis.h5');                     
body(2).geometryFile = '../../../geometry/flap.stl';
body(2).mass = 23.14;                       %[kg] from Exp
body(2).momOfInertia = [1.42 1.19 1.99];    %[kg-m^2] from Exp
body(2).viscDrag.cd(1) = 1.28;              % from surge decay
body(2).viscDrag.characteristicArea(1) = 0.5; %0.402424;  %[m^2] from surge decay
body(2).viscDrag.cd(5) = 8;                 % see Babarit ref
body(2).viscDrag.characteristicArea(5) = 0.0062;  %[m^2] w=0.76;h=0.46
% Second Momoent Area - Iyy = w*h^3/12
% https://en.wikipedia.org/wiki/List_of_area_moments_of_inertia

body(2).cg = [-0.65 0.0 -0.338];             %[m] for setInitDisp
body(2).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Body 3: WEC - Platform
body(3) = bodyClass('../../../hydroData/Analysis.h5');                     
body(3).geometryFile = '../../../geometry/platform.stl';
body(3).viz.color = [1 1 1];
body(3).viz.opacity = 0.25;
body(3).mass = 153.8+22.24;              %[kg]  from Exp + PVC
body(3).momOfInertia = [37.88 29.63 53.61]; %[kg-m^2] from Exp
body(3).viscDrag.cd(3) = 1.28;                  %flat plate
body(3).viscDrag.characteristicArea(3) = 1.22; %[m^2] 1.6*1.2-0.7*1 = 1.22
body(3).linearDamping(3) = 450;  

body(3).linearDamping(5) = 40;  
body(3).viscDrag.cd(5) = 8;
body(3).viscDrag.characteristicArea(5) = 0.0112;   %[m^2] w=0.96;h=0.52;
% Second Momoent Area - Iyy = w*h^3/12
% https://en.wikipedia.org/wiki/List_of_area_moments_of_inertia

body(3).cg = [0.0 0.0 -0.063];              %[m] for setInitDisp
body(3).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Arm Mass Properties 
%% Body 4: Arm - Rectangle Frame (attached to FOSWEC)
body(4) = bodyClass('');
body(4).nhBody = 1;
body(4).name = 'arm_rectangle';
body(4).geometryFile = '../../../geometry/rectangle.stl';
body(4).viz.color = [1 0 0];
body(4).viz.opacity = 1;
body(4).mass = 23.66;                       %[kg] from Exp
body(4).momOfInertia = [1.44 2.21 3.58];    %[kg-m^2] from Exp
body(4).cg = [0 0 -0.366];                  %[m] from Exp
body(4).dispVol = 0;

body(4).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Body 5: Arm - Pitching Squares
body(5) = bodyClass('');
body(5).nhBody = 1;
body(5).name = 'arm_squares';
body(5).geometryFile = '../../../geometry/squares.stl';
body(5).viz.color = [0 1 0];
body(5).viz.opacity = 1;
body(5).mass = 4.47;                        %[kg] from Exp  
body(5).momOfInertia = [0.30, 0.02, 0.30];  %[kg-m^2] from Exp
body(5).cg = [0 0 -0.366];                  %[m] from Exp
body(5).dispVol = 0.001599;                 %[m] from Exp
   
body(5).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Body 6: Arm - Heaving Cylinder
body(6) = bodyClass('');
body(6).nhBody = 1;
body(6).name = 'arm_cylinder';
body(6).geometryFile = '../../../geometry/cylinder.stl';
body(6).viz.color = [0 0 1];
body(6).viz.opacity = 1;
body(6).mass = 27.35;                       %[kg] from Exp 
body(6).momOfInertia = [2.20 2.15 0.28];    %[kg-m^2] from Exp 
body(6).cg = [0 0 -0.832];                  %[m] from Exp 
body(6).dispVol = 0.009782;                 %[m] from Exp

%% Body 7: Arm - Fixed Cylinder (attached to seafloor)
body(7) = bodyClass('');
body(7).nhBody = 1;
body(7).name = 'arm_cylinderFixed';
body(7).geometryFile = '../../../geometry/cylinder_fixed.stl';
body(7).viz.color = [0 0 1];
body(7).viz.opacity = 0.25;
body(7).mass = 1;
body(7).momOfInertia = [1 1 1];
body(7).cg = [0 0 -1.1];
body(7).dispVol = 0.011;                    %[m] from Exp

%% PTO and Constraint Parameters
%% Constraint 1 - Fixed
constraint(1)= constraintClass('arm_wec');
constraint(1).loc = [0 0 -0.366];

constraint(1).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Constraint 2 - Surge
constraint(2)= constraintClass('arm_surge');
constraint(2).loc  = [0 0 -0.366];

% mooring(1) = mooringClass('bungees');
% mooring(1).matrix.k(1,1) =  962; %[N/m] from static offset
% mooring(1).matrix.c(1,1) = 770; %[N/m/s] from surge decay

constraint(2).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Constraint 3 - Pitch
constraint(3)= constraintClass('arm_pitch');
constraint(3).loc = [0 0 -0.366];

constraint(3).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% Constraint 4 - Heave
constraint(4)= constraintClass('arm_heave');
constraint(4).loc = [0 0 -1.36];

%% Constraint 5 - Fixed
constraint(5)= constraintClass('arm_floor');
constraint(5).loc = [0 0 -1.36];

%% PTO 1 - Fixed
constraint(6)= constraintClass('PTO_flap1');
constraint(6).loc = [-0.65 0 -0.5];

constraint(6).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%% PTO 2 - Fixed
constraint(7)= constraintClass('PTO_flap2');
constraint(7).loc = [0.65 0 -0.5];

constraint(7).setInitDisp(ic, [0 1 0], phi*pi/180, [0 0 0]);

%%
clear ic phi 
