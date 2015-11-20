from bemio.io.aqwa import read
from bemio.io.output import write_hdf5

# Load AQWA output data file
aqwa_data = read(hydro_file='./Analysis.AH1',list_file='./Analysis.LIS')

# Calculate IRF and state space coefficients
for i in xrange(aqwa_data.body[0].num_bodies):
	aqwa_data.body[i].calc_irf_radiation(t_end=20,n_t=1001,n_w=1001)
	aqwa_data.body[i].calc_irf_excitation(t_end=20,n_t=1001,n_w=1001)
	#aqwa_data.body[i].calc_ss_radiation(max_order=3, r2_thresh=0.5 )

# Write hydrodynamic data to HDF5 file format
write_hdf5(aqwa_data)
