%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Free Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

%% Heave Decay
cd heaveDecay\heaveDecay_damping\
wecSimMCR
plotHeaveDecay
cd ../..

%% Pitch Decay
cd pitchDecay\pitchDecay_damping\
wecSimMCR
plotPitchDecay
cd ../..

%% Surge Decay
cd surgeDecay\surgeDecay_stiffness_damping\
wecSimMCR
plotSurgeDecay
cd ../..

%% Flap Decay
cd flapDecay\flapDecay_damping\
wecSimMCR
plotFlapDecay
cd ../..
