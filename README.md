# PyCBC Inference: A Python-based parameter estimation toolkit for compact-object merger signals

**C. M. Biwer<sup>1,2</sup>, C. Capano<sup>3</sup>, Soumi De<sup>2</sup>, M. Cabero<sup>3</sup>, Duncan A. Brown<sup>2</sup>, Alevander H. Nitz<sup>3</sup>, V. Raymond<sup>4</sup>**

**<sup>1</sup>Applied Computer Science (CCS-7), Los Alamos National Laboratory, Los Alamos, NM, 87545, USA**

**<sup>2</sup>Department of Physics, Syracuse University, Syracuse, NY 13244, USA**

**<sup>3</sup>Albert-Einstein-Institut, Max-Planck-Institut for Gravitationsphysik, D-30167 Hannover, Germany**

**<sup>4</sup>Albert-Einstein-Institut, Max-Planck-Institue for Gravitationsphysik, D-14476 Potsdam, Germany**

## License

![Creative Commons License](https://i.creativecommons.org/l/by-sa/3.0/us/88x31.png "Creative Commons License")

This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 United States License](http://creativecommons.org/licenses/by-sa/3.0/us/).

## Introduction

The contents in this repository is a companion to the paper posted at [arxiv:1804.08583](https://arxiv.org/abs/XXX). We release posterior probability density files from the MCMC from running PyCBC inference on the gravitational-wave data for the binary black hole events GW150914, GW151226, and LVT151012, detected during LIGO's first observing run. We provide a notebook to demonstrate how to read these posterior files and reconstruct figures 4, 5 and 6 in the paper. We also provide the ini files and sample scripts with command lines to run the PyCBC inference parameter estimation analysis on the gravitational-wave data for the three events.

We encourage use of these data in derivative works. If you use the material provided here, please cite the paper using the reference:
```
@article{Biwer:2018,
      author         = "Biwer, C. M. and Capano, C. and De, Soumi and
                        Cabero, M. and Brown, Duncan A. and Nitz, Alexander H. and Raymond, V.
                        M.",
      title          = "{PyCBC Inference: A Python-based parameter estimation toolkit for compact-object merger signals}",
      year           = "2018",
      eprint         = "XXX",
      archivePrefix  = "arXiv",
      primaryClass   = "YYY",
      SLACcitation   = "%%CITATION = ARXIV:XXX;%%"
}
```

The data provided contain the thinned posterior samples from the MCMC chains used to produce the posterior probability density and histogram plots. These data are stored in the folder ``posteriors`` in the files:

 1. [gw150914_posteriors_thinned.hdf](https://github.com/gwastro/pycbc-inference-paper/blob/master/posteriors/gw150914_posteriors_thinned.hdf) contains the posterior samples from the MCMC for measuring properties of GW150914.
 2. [gw151226_posteriors_thinned.hdf](https://github.com/gwastro/pycbc-inference-paper/blob/master/posteriors/gw151226_posteriors_thinned.hdf) contains the posterior samples from the MCMC for measuring properties of GW151226.
 3. [lvt151012_posteriors_thinned.hdf](https://github.com/gwastro/pycbc-inference-paper/blob/master/posteriors/lvt151012_posteriors_thinned.hdf) contains the posterior samples from the MCMC for measuring properties of LVT151012.

The results for the astrophysical events in the paper were generated with the [PyCBC v1.9.4 release.](https://github.com/gwastro/pycbc/releases/tag/v1.9.4)

## Runing the notebook in a Docker container

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
This work was supported by NSF awards PHY-1404395 (DAB, CMB), PHY-1707954 (DAB, SD), and PHY-1607169 (SD). Computations were supported by Syracuse University and NSF award OAC-1541396. We also acknowledge the Max Planck Gesellschaft for support and the Atlas cluster computing team at AEI Hannover. This research has made use of data obtained from the LIGO Open Science Center, a service of LIGO Laboratory, the LIGO Scientific Collaboration and the Virgo Collaboration. LIGO is funded by the U.S. National Science Foundation. Virgo is funded by the French Centre National de Recherche Scientifique (CNRS), the Italian Istituto Nazionale della Fisica Nucleare (INFN) and the Dutch Nikhef, with contributions by Polish and Hungarian institutes.
