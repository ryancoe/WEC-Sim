%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Heave Decay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[stat, mess] = rmdir(['heaveDecayCase_',num2str(mcr.cases(imcr)*100,'%2g'),'cm'],'s');
movefile('output',['heaveDecayCase_',num2str(mcr.cases(imcr)*100,'%2g'),'cm'])

figure
plot(output.bodies(1).time,output.bodies(1).position(:,3)-body(1).hydroData.properties.cg(3));
title('platform heave')
xlabel('time (s)')
ylabel('displacement (m)')
grid on

savefig(['heaveDecayCase_',num2str(mcr.cases(imcr)*100,'%2g'),'cm/platformHeave.fig'])

[stat, mess] = rmdir('output','s');
