%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Surge Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('surgeDecayCase.mat')
load ./exp/SurgeDecay_norm_postp_mean.mat

%% Plot Exp and WS Data

figure;

%EXP
for i=1:4
    plot(T_mean(i).t_corrected,T_mean(i).y_norm,'-','LineWidth',1.5);hold on
end
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for j=1:length(T_mean(1).error_bar_norm)
    ind(j)= find(T_mean(i).t_corrected==T_mean(i).t_error_bar(j));
end
for i = 1:4
    errorbar(T_mean(i).t_error_bar,T_mean(i).y_norm(ind(:)),T_mean(i).error_bar_norm,'*'); hold on;
end

%Linear WS
hold on
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:length(mcr.cases(:,1))
    load(['./surgeDecay_linear_k962/surgeDecayCase_',num2str(mcr.cases(i)*100,'%2g'),'cm/FOSWEC_Surge_matlabWorkspace.mat']) 
    clear disp; disp = [7,10,15,20];
    plot(output.bodies(3).time,(output.bodies(3).position(:,1)-body(3).cg(1))*100/disp(i),':','LineWidth',1.5);   
    hold on
end

xlabel('t [s]')
ylabel('x/x_o')
xlim([-0.5 3.5])
legend('x_0 = 7cm','x_0 = 10cm','x_0 = 15cm','x_0 = 20cm')
% title(['Platform Surge Decay (cd 1.28, c ',num2str(mooring(1).matrix.c(1,1),'%2g'),', k ',num2str(mooring(1).matrix.k(1,1),'%2g'),')'])
savefig('surgeDecay_norm_Exp_WS.fig')
