%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Plot WEC-Sim Decay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('heaveDecayCase.mat')
figure(); 
for i = 1:length(mcr.cases)
    load(['./heaveDecayCase_',num2str(mcr.cases(i)*100,'%2g'),'cm/FOSWEC_Heave_matlabWorkspace.mat']) 
    plot(output.bodies(1).time,output.bodies(1).position(:,3)-body(1).hydroData.properties.cg(3));   
    hold on
end

title('Platform Heave Decay (Damping = 500)')
xlabel('Time (s)')
ylabel('Displacement (m)')
xlim([0 15]);
legend('3cm','5cm','7cm','10cm','15cm')
grid on

savefig('platformHeaveComparison.fig')