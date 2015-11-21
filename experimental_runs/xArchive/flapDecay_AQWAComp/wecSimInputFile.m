%% Simulation Data
simu=simulationClass();
simu.simMechanicsFile = 'FOSWEC.slx';
simu.rampT = 0.001;
simu.endTime = 30;
simu.dt = 0.01;
simu.mode = 'normal';
simu.explorer = 'on';
simu.domainSize = 2;
simu.mcrCaseFile = 'cases.mat';

%% Wave Information
waves = waveClass('noWave');
waves.noWaveHydrodynamicCoeffT=2*pi/0.7222053;
%waves.noWaveHydrodynamicCoeffT=2*pi/22.7812443;
%
%waves = waveClass('regular');
%waves.T=2*pi/0.7222053;
%waves.H=0;
%
%waves = waveClass('regularCIC');
%waves.T=2*pi/0.7222053;
%waves.H=0;
%
%waves = waveClass('noWaveCIC')

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

%% PTO and Constraint Parameters
%% Constraint 1
constraint(1)= constraintClass('platform_fixed');
constraint(1).loc = [0 0 -1.36];

%% PTO 1
pto(1) = ptoClass('PTO_flap1');
pto(1).k = 0;
pto(1).c = 0;
%pto(1).loc = [-0.61 0 -0.5];
pto(1).loc = [-0.65 0 -0.5];

%% Constraint 2
constraint(2) = constraintClass('fixed_flap2');
%constraint(2).loc = [0.61 0 -0.5];
constraint(2).loc = [0.65 0 -0.5];


