%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Heave Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('heaveDecayCase.mat')
load ./exp/HeaveDecay_norm_postp_mean.mat

%% Plot Exp and WS Data

figure;

%EXP
for i=1:5
    plot(T_mean(i).t_corrected,T_mean(i).y_norm,'-','LineWidth',1.5);hold on
end
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for j=1:length(T_mean(1).error_bar_norm)
    ind(j)= find(T_mean(i).t_corrected==T_mean(i).t_error_bar(j));
end
for i = 1:5
    errorbar(T_mean(i).t_error_bar,T_mean(i).y_norm(ind(:)),T_mean(i).error_bar_norm,'*'); hold on;
end

disp = [3,5,7,10,15];
%NonLinear WS
% hold on
% set(gca,'ColorOrderIndex',1)
% set(gcf, 'Color', 'w');
% for i = 1:length(mcr.cases(:,1))
%     load(['./heaveDecayCase_',num2str(mcr.cases(i)*100,'%2g'),'cm/FOSWEC_Heave_matlabWorkspace.mat']) 
%     plot(output.bodies(2).time,(output.bodies(2).position(:,3)-body(2).cg(3))*100/disp(i),'-.','LineWidth',1.5);   
%     hold on
% end

%Linear WS
hold on
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:length(mcr.cases(:,1))
    load(['./heaveDecay_linear_c450/heaveDecayCase_',num2str(mcr.cases(i)*100,'%2g'),'cm/FOSWEC_Heave_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,(output.bodies(2).position(:,3)-body(2).cg(3))*100/disp(i),':','LineWidth',1.5);   
    hold on
end

%Linear WS noCd
hold on
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:length(mcr.cases(:,1))
    load(['./heaveDecay_linear_c450_cd0/heaveDecayCase_',num2str(mcr.cases(i)*100,'%2g'),'cm/FOSWEC_Heave_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,(output.bodies(2).position(:,3)-body(2).cg(3))*100/disp(i),'-.','LineWidth',1.5);   
    hold on
end


xlabel('t [s]')
ylabel('z/z_o')
xlim([-0.5 3.5])
for i = 1:length(disp)
    leg{i} = ['z_0 = ' num2str(disp(i),3) '^o'];
end
legend(leg,'location','northeast')
title('Heave Decay (Exp, Linear c450, Linear cd0)')

savefig('Heave_Exp_WS_All_norm.fig')
