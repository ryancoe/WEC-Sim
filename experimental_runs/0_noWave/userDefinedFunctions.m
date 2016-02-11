%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        No Wave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% heave
figure
plot(output.bodies(1).time,output.bodies(1).position(:,3)-body(1).hydroData.properties.cg(3));
title('platform heave')
xlabel('time (s)')
ylabel('displacement (m)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_heave.fig')

%% pitch
figure
plot(output.bodies(1).time,output.bodies(1).position(:,5));
title('platform pitch')
xlabel('time (s)')
ylabel('displacement (deg)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_pitch.fig')

%% surge
figure
plot(output.bodies(1).time,output.bodies(1).position(:,1)-body(1).hydroData.properties.cg(1));
title('platform surge')
xlabel('time (s)')
ylabel('displacement (m)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_surge.fig')
