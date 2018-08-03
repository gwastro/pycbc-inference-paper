#! /bin/bash -v

# The following shows the process of thinning the chains of posterior samples stored in the output file obtained from running pycbc_inference. The chains can then be thinned to eliminate correlations along the chains and extracting independent samples.

# The output file from running pycbc_inference using the sample script pycbc-inference-paper/run_files/GW150914/run_pycbc_inference.sh is gw150914_inference.hdf . We then thin the samples and store them in gw150914_inference_thinned.hdf .

input_file=gw150914_inference.hdf
thin_start=`echo "from pycbc.io.inference_hdf import InferenceFile; import numpy; fp=InferenceFile('${input_file}', 'r'); print(int(fp.niterations/2) - 1); fp.close()" | python`
echo ${thin_start}
thin_end=`echo "from pycbc.io.inference_hdf import InferenceFile; import numpy; fp=InferenceFile('${input_file}', 'r'); print(fp.niterations - 1); fp.close()" | python`
echo ${thin_end}

# Compute autocorrelation length by considering the portion of the chains between the midway iteration and last iteration
acl=`echo "from pycbc.io.inference_hdf import InferenceFile; import numpy; fp=InferenceFile('${input_file}', 'r'); print(numpy.array(fp.sampler_class.compute_acls(fp, start_index=${thin_start}, end_index=${thin_end}).values()).max()); fp.close()" | python`
echo ${acl}

# Extract independent samples from the second halves of the chains drawing samples with an interval of the acl

pycbc_inference_extract_samples --verbose \
    --output-file gw150914_inference_thinned.hdf \
    --input-file ${input_file} \
    --posterior-only \
    --thin-start ${thin_start} \
    --thin-end ${thin_end} \
    --thin-interval ${acl}

