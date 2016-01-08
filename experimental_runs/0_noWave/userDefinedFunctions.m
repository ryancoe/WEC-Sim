%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        No Wave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot(output.bodies(1).time,output.bodies(1).position(:,3)-body(1).hydroData.properties.cg(3));
title('platform heave')
xlabel('time (s)')
ylabel('displacement (m)')
ylim([-0.5,0.5])
grid on

savefig('./output/noWave.fig')
