%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Plot WEC-Sim Decay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('surgeDecayCase.mat')
figure(); 
for i = 1:length(mcr.cases)
    load(['./surgeDecayCase_',num2str(mcr.cases(i)*100,'%2g'),'cm/FOSWEC_Surge_matlabWorkspace.mat']) 
    plot(output.bodies(1).time,output.bodies(1).position(:,1)-body(1).hydroData.properties.cg(1));   
    hold on
end

title(['Platform Surge Decay (cd 1.28, c ',num2str(constraint(2).mooring.c(1,1),'%2g'),', k ',num2str(constraint(2).mooring.k(1,1),'%2g'),')'])
xlabel('Time (s)')
ylabel('Displacement (m)')
xlim([0 10]);
legend('7cm','10cm','15cm','20cm')
grid on

savefig('platformSurgeComparison.fig')