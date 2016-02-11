%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Plot WEC-Sim Decay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('pitchDecayCase.mat')
figure(); 
for i = 1:length(mcr.cases)
    load(['./pitchDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi);   
    hold on
end

title('Flap Pitch Decay (damping15)')
xlabel('Time (s)')
ylabel('Displacement (deg)')
xlim([0 30]);
legend('5deg','7deg','10deg','15deg','20deg')
grid on

savefig('flapPitchComparison.fig')