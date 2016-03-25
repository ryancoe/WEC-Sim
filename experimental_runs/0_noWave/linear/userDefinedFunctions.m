%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        No Wave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% heave
figure
plot(output.bodies(3).time,output.bodies(3).position(:,3)-body(3).hydroData.properties.cg(3));
title('platform heave')
xlabel('time (s)')
ylabel('displacement (m)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_heave.fig')

%% pitch
figure
plot(output.bodies(3).time,output.bodies(3).position(:,5)*180/pi);
title('platform pitch')
xlabel('time (s)')
ylabel('displacement (deg)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_pitch.fig')

%% surge
figure
plot(output.bodies(3).time,output.bodies(3).position(:,1)-body(3).hydroData.properties.cg(1));
title('platform surge')
xlabel('time (s)')
ylabel('displacement (m)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_surge.fig')


%% flaps
figure
plot(output.bodies(1).time,output.bodies(1).position(:,5)*180/pi);
hold on;
plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi);
title('flap pitch')
xlabel('time (s)')
ylabel('displacement (deg)')
ylim([-0.5,0.5])
grid on
savefig('./output/noWave_flap.fig')


