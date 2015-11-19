%% Simulation Data
simu=simulationClass();
simu.simMechanicsFile = 'FOSWEC.slx';
simu.rampT = 10;
simu.endTime = 40;
simu.dt = 0.01;
simu.mode = 'normal';
simu.explorer = 'on';
simu.domainSize = 2;

%% Wave Information
%waves = waveClass('noWave');
%waves.noWaveHydrodynamicCoeffT=2*pi/0.7222053;
%
waves = waveClass('regular');
waves.T=2;
waves.H=0.1;
%
%waves = waveClass('noWaveCIC');

%% Body Data
%% Body 1: Platform
body(1) = bodyClass('./hydroData/Analysis.h5',1);                     
body(1).geometryFile = './geometry/platform.stl';
body(1).mass = 79.437181353569;    
body(1).momOfInertia = [57.0431 47.211 66.2529];
body(1).viz.color = [1 1 1];
body(1).viz.opacity = 0.25;

%% Body 2: Front Flap
body(2) = bodyClass('./hydroData/Analysis.h5',2);                     
body(2).geometryFile = './geometry/flap.stl';
body(2).mass = 13.5204596444964;     
body(2).momOfInertia = [2.3664 1.0264 1.3736];
%body(2).linearDamping(5) = 10;  
%alpha = 15*pi/180;
%r = 0.5 - 0.338;
%body(2).initDisp.initLinDisp = [r*sin(alpha),0,-1*r*(1-cos(alpha))];
%body(2).initDisp.initAngularDispAxis = [0 1 0];
%body(2).initDisp.initAngularDispAngle = alpha;
%clear r alpha

%% Body 3: Back Flap
body(3) = bodyClass('./hydroData/Analysis.h5',3);                     
body(3).geometryFile = './geometry/flap.stl';
body(3).mass = 13.5204596444964;     
body(3).momOfInertia = [2.3664 1.0264 1.3736];

%% Cyl Fixed
cylFixed.mass = 1;
cylFixed.momOfInertia = [1 1 1];
cylFixed.cg = [0 0 -1.1];
cylFixed.dispVol = 1/1000;
cylFixed.initDisp.initLinDisp = [0 0 0];
cylFixed.initDisp.initAngularDispAxis = [0 1 0];
cylFixed.initDisp.initAngularDispAngle = 0;
cylFixed.geometryFile = 'empty.stl';
cylFixed.viz.color = [0 0 1];
cylFixed.viz.opacity = 0.25;

%% Cyl Heaving
cyl.mass = 13.52;
cyl.momOfInertia = [1 1 1];
cyl.cg = [0 0 -0.75];
cyl.dispVol = 0;
cyl.initDisp.initLinDisp = [0 0 0];
cyl.initDisp.initAngularDispAxis = [0 1 0];
cyl.initDisp.initAngularDispAngle = 0;
cyl.geometryFile = 'empty.stl';
cyl.viz.color = [0 0 1];
cyl.viz.opacity = 1;

%% Squares Pitching
squares.mass = 13.52;
squares.momOfInertia = [1 1 1];
squares.cg = [0 0 -0.5];
squares.dispVol = 0;
squares.initDisp.initLinDisp = [0 0 0];
squares.initDisp.initAngularDispAxis = [0 1 0];
squares.initDisp.initAngularDispAngle = 0;
squares.geometryFile = 'empty.stl';
squares.viz.color = [0 1 0];
squares.viz.opacity = 1;

%% Rectangle Surging
rectangleFrame.mass = 79.4;
rectangleFrame.momOfInertia = [1 1 1];
rectangleFrame.cg = [0 0 -0.5];
rectangleFrame.dispVol = 0;
rectangleFrame.initDisp.initLinDisp = [0 0 0];
rectangleFrame.initDisp.initAngularDispAxis = [0 1 0];
rectangleFrame.initDisp.initAngularDispAngle = 0;
rectangleFrame.geometryFile = 'empty.stl';
rectangleFrame.viz.color = [1 0 0];
rectangleFrame.viz.opacity = 1;





%% PTO and Constraint Parameters

%% PTO 1
pto(1) = ptoClass('PTO_flap1');
pto(1).k = 0;
pto(1).c = 0;
%pto(1).loc = [-0.61 0 -0.5];
pto(1).loc = [-0.65 0 -0.5];

%% PTO 2
pto(2) = ptoClass('PTO_flap2');
pto(2).k = 0;
pto(2).c = 0;
pto(2).loc = [0.65 0 -0.5];

%% Constraint 1
constraint(1)= constraintClass('rectangle_fixed');
constraint(1).loc = [0 0 -0.5];

%% Constraint 2
constraint(2)= constraintClass('arm_surge');
constraint(2).loc = [0 0 -0.5];

%% Constraint 3
constraint(3)= constraintClass('arm_pitch');
constraint(3).loc = [0 0 -0.5];

%% Constraint 4
constraint(4)= constraintClass('arm_heave');
constraint(4).loc = [0 0 -0.75];

%% Constraint 5
constraint(5)= constraintClass('arm_floor');
constraint(5).loc = [0 0 -1];
