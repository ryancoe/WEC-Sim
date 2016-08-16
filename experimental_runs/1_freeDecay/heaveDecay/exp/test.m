
clear all; close all; clc;

load Flap1Decay_postp_mean.mat

figure;
for i=1:5
    plot(T_mean(i).t_corrected,T_mean(i).y,'LineWidth',1.5);hold on
end

set(gca,'ColorOrderIndex',1)
set(gcf, 'Color', 'w');

for i = 1:5
    for j=1:9
        ind(j)= find(T_mean(i).t_corrected==T_mean(i).t_error_bar(j));
    end
    errorbar(T_mean(i).t_error_bar,T_mean(i).y(ind(:)),T_mean(i).error_bar,'*'); hold on;
end

xlabel('t [s]')
ylabel('\theta/\theta_o')
xlim([-0.5 6.25])
delta_theta = [5,7,10,15,20];
for i = 1:length(delta_theta)
    leg{i} = ['\theta_0 = ' num2str(delta_theta(i),3) '^o'];
end
legend(leg,'location','northeast')
title('flap decay exp')