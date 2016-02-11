%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Flap Decay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[stat, mess] = rmdir(['flapDecayCase_',num2str(mcr.cases(imcr,1),'%2g'),'deg'],'s');
movefile('output',['flapDecayCase_',num2str(mcr.cases(imcr,1),'%2g'),'deg'])

figure
plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi);
title('Flap1 Pitch')
xlabel('time (s)')
ylabel('displacement (deg)')
grid on

savefig(['flapDecayCase_',num2str(mcr.cases(imcr,1),'%2g'),'deg/Flap1Pitch.fig'])

[stat, mess] = rmdir('output','s');

clear stat mess phi