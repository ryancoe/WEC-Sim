%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Free Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

%% Heave Decay
cd heaveDecay\
wecSimMCR
plotHeaveDecay
clear all
cd ..

%% Pitch Decay
cd pitchDecay\
wecSimMCR
plotPitchDecay
clear all
cd ..

%% Surge Decay
cd surgeDecay\
wecSimMCR
plotSurgeDecay
clear all
cd ..

%% Flap Decay
cd flapDecay\
wecSimMCR
plotFlapDecay
clear all
cd ..
