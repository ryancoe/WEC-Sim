%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Flap Decay                               %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;

load('flapDecayCase.mat')
load ./exp/Flap1Decay_postp_mean.mat


%% Plot Exp and WS Data

figure;

for i=1:5
    plot(T_mean(i).t_corrected,T_mean(i).y,'-','LineWidth',1.5);hold on
end
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:5
    for j=1:9
        ind(j)= find(T_mean(i).t_corrected==T_mean(i).t_error_bar(j));
    end
    errorbar(T_mean(i).t_error_bar,T_mean(i).y(ind(:)),T_mean(i).error_bar,'*'); hold on;
end


hold on
set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');
for i = 1:length(mcr.cases)
    load(['./flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
    plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi,'-.','LineWidth',1.5);   
    hold on
end

xlabel('t [s]')
ylabel('\theta/\theta_o')
xlim([-0.5 6.25])
ylim([-15 20]);
delta_theta = [5,7,10,15,20];
for i = 1:length(delta_theta)
    leg{i} = ['\theta_0 = ' num2str(delta_theta(i),3) '^o'];
end
legend(leg,'location','northeast')
% title('Exp WS Flap Decay (NonLinear)')

title(['Exp WS Flap Decay (NonLinear, cd ',num2str(body(2).viscDrag.cd(5),'%2g'),', c ',num2str(body(2).linearDamping(5),'%2g'),')'])

savefig('flapPitch_Exp_WS.fig')

%% Old Figs

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
xlim([0 8]);
ylim([-15 20]);
legend('5deg','7deg','10deg','15deg','20deg')
grid on

savefig('flapPitch_WS.fig')


%% Plot Exp and WS Data

% figure;
% for i=1:5
%     plot(T_mean(i).t_corrected,T_mean(i).y,'--','LineWidth',1.5);hold on
% end
% 
% set(gca,'ColorOrderIndex',1)
% set(gcf, 'Color', 'w');
% 
% for i = 1:5
%     for j=1:9
%         ind(j)= find(T_mean(i).t_corrected==T_mean(i).t_error_bar(j));
%     end
%     errorbar(T_mean(i).t_error_bar,T_mean(i).y(ind(:)),T_mean(i).error_bar,'*'); hold on;
% end
% 
% xlabel('t [s]')
% ylabel('\theta/\theta_o')
% xlim([-0.5 6.25])
% ylim([-15 20]);
% delta_theta = [5,7,10,15,20];
% for i = 1:length(delta_theta)
%     leg{i} = ['\theta_0 = ' num2str(delta_theta(i),3) '^o'];
% end
% legend(leg,'location','northeast')
% title('Exp Flap Decay')
% 
% savefig('flapPitch_Exp.fig')
% 
% hold on
% set(gca,'ColorOrderIndex',1)
% set(gcf, 'Color', 'w');
% 
% for i = 1:length(mcr.cases)
%     load(['./flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
%     plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi,'LineWidth',1.5);   
%     hold on
% end
% 
% savefig('flapPitch_Exp_WS.fig')


%% Plot AQWA
% 
% load('./AQWA/AQWAFlapPitchLinearHydrostaticFreeDecay.mat') 
% 
% Damp = [10];
% Ang = [5,10,15];
% figure; 
% plot(time,-Flap1pitch(:,7));hold on;
% plot(time,-Flap1pitch(:,8));hold on; 
% plot(time,-Flap1pitch(:,9))
% 
% title('AQWA Flap Decay (c 10)')
% xlabel('Time (s)')
% ylabel('Displacement (deg)')
% xlim([0 8]);
% ylim([-15 20]);
% legend('5deg','10deg','15deg')
% grid on
% 
% savefig('flapPitchAQWA.fig')


%% Compare Exp to WS

% open ./exp/Flap1Decay_mean.fig
% % set(findall(gca, 'Type', 'Line'),'LineStyle',':');
% % % test = findall(gca, 'Type', 'Line');
% % % for i=1:5
% % %     test(i).LineStyle = ':';
% % % end
% 
% hold on
% 
% for i = 1:length(mcr.cases)
%     load(['./flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
%     plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi,'k-');   
%     hold on
% end
% % hold on
% % plot(time,-Flap1pitch(:,7),'--');hold on;
% % plot(time,-Flap1pitch(:,8),'--');hold on; 
% % plot(time,-Flap1pitch(:,9),'--')
% 
% legend('5deg','7deg','10deg','15deg','20deg','5deg','7deg','10deg','15deg','20deg','5deg','10deg','15deg')


%% Compare WS and AQWA

% figure(); 
% for i = 1:length(mcr.cases)
%     load(['./flapDecayCase_',num2str(mcr.cases(i),'%2g'),'deg/FOSWEC_flapPitch_matlabWorkspace.mat']) 
%     plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi);   
%     hold on
% end
% hold on
% plot(time,-Flap1pitch(:,7),'--');hold on;
% plot(time,-Flap1pitch(:,8),'--');hold on; 
% plot(time,-Flap1pitch(:,9),'--')
% 
% title(['WEC-Sim Flap Decay (cd ',num2str(body(2).viscDrag.cd(5),'%2g'),', c ',num2str(body(2).linearDamping(5),'%2g'),')'])
% xlabel('Time (s)')
% ylabel('Displacement (deg)')
% xlim([0 8]);
% ylim([-15 20]);
% legend('5deg','7deg','10deg','15deg','20deg','5deg','10deg','15deg')
% grid on
% 
% savefig('flapPitch_WS_AQWA.fig')