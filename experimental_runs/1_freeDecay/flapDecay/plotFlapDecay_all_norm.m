%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Flap Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('flapDecayCase.mat')
load ./exp/Flap1Decay_norm_postp_mean.mat

%% Plot Exp and WS Data

figure;

%EXP
for i=1:5
    plot(T_mean(i).t_corrected,T_mean(i).y_norm,'-','LineWidth',1.5);hold on
end
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:5
    for j=1:9
        ind(j)= find(T_mean(i).t_corrected==T_mean(i).t_error_bar(j));
    end
    errorbar(T_mean(i).t_error_bar,T_mean(i).y_norm(ind(:)),T_mean(i).error_bar_norm,'*'); hold on;
end

theta = [5,7,10,15,20];
%NonLinear WS
hold on
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:length(mcr.cases)
    load(['./flapDecay_nonlinear/flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi/theta(i),'-.','LineWidth',1.5);   
    hold on
end

%Linear WS
hold on
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:length(mcr.cases)
    load(['./flapDecay_linear/flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi/theta(i),':','LineWidth',1.5);   
    hold on
end

xlabel('t [s]')
ylabel('\theta/\theta_o')
xlim([-0.5 6.25])
% ylim([-15 20]);
for i = 1:length(theta)
    leg{i} = ['\theta_0 = ' num2str(theta(i),3) '^o'];
end
legend(leg,'location','northeast')
% title('Exp WS Flap Decay (All)')
title(['Flap Decay Exp, NonLinear, Linear (cd ',num2str(body(2).viscDrag.cd(5),'%2g'),', c ',num2str(body(2).linearDamping(5),'%2g'),')'])

savefig('flapDecay_norm_Exp_WS.fig')


