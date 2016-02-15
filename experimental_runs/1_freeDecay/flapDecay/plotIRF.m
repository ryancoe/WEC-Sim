%Plot pitch IRF
figure
plot(body(2).hydroData.hydro_coeffs.radiation_damping.impulse_response_fun.t,...
    squeeze(body(2).hydroData.hydro_coeffs.radiation_damping.impulse_response_fun.K(5,11,:)))

savefig flapIRF.fig