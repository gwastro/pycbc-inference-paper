#! /bin/bash -v

# The frame files can be downloaded from the LIGO Open Science Center (LOSC) with the following commands
#wget https://losc.ligo.org/s/events/GW151226/H-H1_LOSC_16_V2-1135136228-4096.gwf
#wget https://losc.ligo.org/s/events/GW151226/L-L1_LOSC_16_V2-1135136228-4096.gwf

# This can also be run on multiple machines using MPI for which add --use-mpi to the command line below

total_processes=190

pycbc_seed=12
pycbc_walkers=5320

pycbc_config_file=gw151226_inference.ini
pycbc_output_file=gw151226_inference.hdf

niters=100000
checkpoint=500

pycbc_inference --verbose \
--seed ${pycbc_seed} \
--instruments H1 L1 \
--gps-start-time 1135136340 \
--gps-end-time 1135136356 \
--frame-files H1:/home/soumi.de/projects/cbc/inference_for_events/GW151226/losc_data/H-H1_LOSC_16_V2-1135136228-4096.gwf L1:/home/soumi.de/projects/cbc/inference_for_events/GW151226/losc_data/L-L1_LOSC_16_V2-1135136228-4096.gwf \
--channel-name H1:LOSC-STRAIN L1:LOSC-STRAIN \
--strain-high-pass 15 \
--pad-data 8 \
--psd-start-time 1135136238 \
--psd-end-time 1135137278 \
--psd-estimation median \
--psd-segment-length 8 \
--psd-segment-stride 4 \
--psd-inverse-length 4 \
--psd-gate H1:1135136350.0:2.0:0.5 L1:1135136350.0:2.0:0.5 \
--sample-rate 2048 \
--low-frequency-cutoff 20 \
--config-file ${pycbc_config_file} \
--output-file ${pycbc_output_file} \
--processing-scheme mkl \
--sampler emcee_pt \
--ntemps 5 \
--likelihood-evaluator marginalized_phase \
--nwalkers ${pycbc_walkers} \
--niterations ${niters} \
--checkpoint-interval ${checkpoint} \
--nprocesses ${total_processes}
