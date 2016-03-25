%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Free Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;


%% Flap Decay
cd flapDecay\
cd flapDecay_linear\
    wecSimMCR
    plotFlapDecay
    clear all
    cd ..
cd flapDecay_nonlinear\
    wecSimMCR
    plotFlapDecay
    clear all
    cd ..
plotFlapDecay_all_norm
cd ..

%% Heave Decay
cd heaveDecay\
cd heaveDecay_linear_c450_cd0\
    wecSimMCR
    plotHeaveDecay
    clear all
    cd ..
cd heaveDecay_linear_c450_cd128\
    wecSimMCR
    plotHeaveDecay
    clear all
    cd ..
plotHeaveDecay_all_norm
cd ..

%% Pitch Decay
cd pitchDecay\
cd pitchDecay_linear\
    wecSimMCR
    plotPitchDecay
    clear all
    cd ..
cd pitchDecay_nonlinear\
    wecSimMCR
    plotPitchDecay
    clear all
    cd ..
plotPitchDecay_all_norm
cd ..

%% Surge Decay
cd surgeDecay\
cd surgeDecay_linear_k962\
    wecSimMCR
    plotSurgeDecay
    clear all
    cd ..
plotSurgeDecay_all_norm
cd ..
