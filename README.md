# PyCBC Inference: A Python-based parameter estimation toolkit for compact-object merger signals

**C. M. Biwer<sup>1,2</sup>, Collin D. Capano<sup>3</sup>, Soumi De<sup>2</sup>, Miriam Cabero<sup>3</sup>, Duncan A. Brown<sup>2</sup>, Alexander H. Nitz<sup>3</sup>, V. Raymond<sup>4,5</sup>**

**<sup>1</sup>Los Alamos National Laboratory, Los Alamos, NM 87545, USA**

**<sup>2</sup>Department of Physics, Syracuse University, Syracuse, NY 13244, USA**

**<sup>3</sup>Albert-Einstein-Institut, Max-Planck-Institut for Gravitationsphysik, D-30167 Hannover, Germany**

**<sup>4</sup>Albert-Einstein-Institut, Max-Planck-Institut for Gravitationsphysik, D-14476 Potsdam, Germany**

**<sup>5</sup>School of Physics and Astronomy, Cardiff University, Cardiff, CF243AA, Wales, UK**

## License

![Creative Commons License](https://i.creativecommons.org/l/by-sa/3.0/us/88x31.png "Creative Commons License")

This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 United States License](http://creativecommons.org/licenses/by-sa/3.0/us/).

## Introduction

The contents in this repository is a companion to the paper posted at [arxiv:1807.10312](https://arxiv.org/abs/1807.10312). We release posterior probability density files from the MCMC from running PyCBC inference on the gravitational-wave data for the binary black hole events GW150914, GW151226, and LVT151012, detected during LIGO's first observing run. We provide a notebook to demonstrate how to read these posterior files and reconstruct figures 4, 5 and 6 in the paper. We also provide the configuration files and sample scripts with command lines to run the PyCBC inference parameter estimation analysis on the gravitational-wave data for the three events.

We encourage use of these data in derivative works. If you use the material provided here, please cite the paper using the reference:
```
@article{Biwer:2018,
      author         = "Biwer, C. M. and Capano, Collin D. and De, Soumi and
                        Cabero, Miriam and Brown, Duncan A. and Nitz, Alexander H. and Raymond, V.",
      title          = "{PyCBC Inference: A Python-based parameter estimation toolkit for compact-object merger signals}",
      year           = "2018",
      eprint         = "1807.10312",
      archivePrefix  = "arXiv",
      primaryClass   = "astro-ph.IM",
      SLACcitation   = "%%CITATION = ARXIV:1807.10312;%%"
}
```

The posterior samples from the PyCBC Inference analyses of GW150914, LVT151012, and GW151226 presented in the paper are stored in the folders ``posteriors/GW150914``, ``posteriors/LVT151012``, and ``posteriors/GW151226`` respectively in the files mentioned below. The data in these files contain the thinned posterior samples from the MCMC chains used to produce the posterior probability density and histogram plots :

 1. [gw150914_posteriors_thinned.hdf](https://github.com/gwastro/pycbc-inference-paper/blob/master/posteriors/gw150914_posteriors_thinned.hdf) contains the posterior samples from the MCMC for measuring properties of GW150914.
 2. [gw151226_posteriors_thinned.hdf](https://github.com/gwastro/pycbc-inference-paper/blob/master/posteriors/gw151226_posteriors_thinned.hdf) contains the posterior samples from the MCMC for measuring properties of GW151226.
 3. [lvt151012_posteriors_thinned.hdf](https://github.com/gwastro/pycbc-inference-paper/blob/master/posteriors/lvt151012_posteriors_thinned.hdf) contains the posterior samples from the MCMC for measuring properties of LVT151012.


The sample scripts with command lines and configuration files for performing the analyses presented in the paper for GW150914, LVT151012, and GW151226 can be found in the folders ``samples/GW150914``, ``samples/LVT151012``, and ``samples/GW151226`` respectively.

The results for the astrophysical events in the paper were generated with the [PyCBC v1.9.4 release.](https://github.com/gwastro/pycbc/releases/tag/v1.9.4)

## Running the notebook in a Docker container

This notebook can be run from a PyCBC Docker container, or a machine with PyCBC installed. Instructions for [downloading the docker container](http://gwastro.github.io/pycbc/latest/html/docker.html) are available from the [PyCBC home page.](https://pycbc.org/) To start a container with instance of Jupyter notebook, run the commands
```sh
docker pull pycbc/pycbc-el7:v1.9.4
docker run -p 8888:8888 --name pycbc_notebook -it pycbc/pycbc-el7:v1.9.4 /bin/bash -l
```
Once the container has started, this git repository can be downloaded with the command:
```sh
git clone https://github.com/gwastro/pycbc-inference-paper.git
```
The notebook server can be started inside the container with the command:
```sh
jupyter notebook --ip 0.0.0.0 --no-browser
```
You can then connect to the notebook server at the URL printed by ``jupyter``. Navigate to the directory `pycbc-inference-paper` in the cloned git repository and open [data_release_pycbc-inference-paper_companion.ipynb](https://github.com/gwastro/pycbc-inference-paper/blob/master/data_release_pycbc-inference-paper_companion.ipynb) (this notebook).

## Funding
This work was supported by NSF awards PHY-1404395 (DAB, CMB), PHY-1707954 (DAB, SD), and PHY-1607169 (SD). Computations were supported by Syracuse University and NSF award OAC-1541396. We also acknowledge the Max Planck Gesellschaft for support and the Atlas cluster computing team at AEI Hannover. The authors thank the LIGO Scientific Collaboration for access to the data and gratefully acknowledge the support of the United States National Science Foundation (NSF) for the construction and operation of the LIGO Laboratory and Advanced LIGO as well as the Science and Technology Facilities Council (STFC) of the United Kingdom, and the Max-Planck-Society (MPS) for support of the construction of Advanced LIGO. Additional support for Advanced LIGO was provided by the Australian Research Council. This research has made use of data obtained from the LIGO Open Science Center (https://losc.ligo.org).
