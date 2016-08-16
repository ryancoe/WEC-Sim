%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Flap Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('flapDecayCase.mat')

%% Plot WEC-Sim

figure; 
for i = 1:length(mcr.cases)
    load(['./flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi);   
    hold on
end

title(['WEC-Sim Flap Decay (cd ',num2str(body(2).viscDrag.cd(5),'%2g'),', c ',num2str(body(2).linearDamping(5),'%2g'),')'])
xlabel('Time (s)')
ylabel('Displacement (deg)')
xlim([0 7]);
ylim([-15 20]);
legend('5deg','7deg','10deg','15deg','20deg')
grid on

savefig('flapPitch_WS.fig')

