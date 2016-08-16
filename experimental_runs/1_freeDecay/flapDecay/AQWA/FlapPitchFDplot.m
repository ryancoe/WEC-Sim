clear; clc; close all

D = load('AQWAFlapPitchLinearHydrostaticFreeDecay.mat');

for i=1:12
    figure
    plot(D.time,D.Flap1pitch(:,i))
    hold on
end

figure
plot(D.time,D.Flap1pitch(:,[4,7,10]))
legend({D.tnames{[4,7,10]}},'Interpreter','none')
xlabel('time (s)'), ylabel('Pitch (\circ)'), grid on
title('Flap Pitch Free Decay 5\circ displacement 5,10,15 Nm/rad/s')

figure
plot(D.time,D.Flap1pitch(:,[5,8,11]))
legend({D.tnames{[5,8,11]}},'Interpreter','none')
xlabel('time (s)'), ylabel('Pitch (\circ)'), grid on
title('Flap Pitch Free Decay 10\circ displacement 5,10,15 Nm/rad/s')

figure
plot(D.time,D.Flap1pitch(:,[6,9,12]))
legend({D.tnames{[6,9,12]}},'Interpreter','none')
xlabel('time (s)'), ylabel('Pitch (\circ)'), grid on
title('Flap Pitch Free Decay 15\circ displacement 5,10,15 Nm/rad/s')
