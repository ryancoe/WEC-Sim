
figure(); hold on;
load('../test/AQWAFlapPitchLinearHydrostaticFreeDecay.mat') 
Damp = [0, 0.5, 1, 1.5];
Ang = [5,10,15];
for id = 1:length(Damp)
	for ia = 1:length(Ang)
		ii = (id-1)*3+ia;
		subplot(length(Damp),length(Ang),ii); hold on
		plot(time,Flap1pitch(:,ii),'b-')
		load(['output_Damp' num2str(Damp(id)) '_Ang' num2str(Ang(ia)) '/FOSWEC_matlabWorkspace.mat'])
		plot(output.bodies(2).time,output.bodies(2).position(:,5)*180/pi,'r--')
		if ia==1
			ylabel(['Damping = ' num2str(Damp(id)) ' N*m/rad' ]);
		end
		if id==length(Damp)
			xlabel(['Initial Displacement = ' num2str(Ang(ia)) ' deg']);
		end
		if ia==length(Ang) && id==1
			legend('AQWA','WEC-Sim')
		end
	end
end




