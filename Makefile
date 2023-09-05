
all: casa_6.2.1.sif casa_6.4.1_pipeline.sif

casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz:
	wget https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz

casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz:
	wget https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz

uvmcmcfit:
	git clone https://github.com/AstroAaron/uvmcmcfit.git

casa_6.2.1.sif: uvmcmcfit casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz
	sudo singularity build casa_6.2.1.sif casa_6.2.1_singularity.def 

casa_6.4.1_pipeline.sif: casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz
	sudo singularity build casa_6.4.1.sif casa_6.4.1_singularity.def 

clean:
	rm -rf uvmcmcfit/
	rm -f casa_6.4.1.sif
	rm -f casa_6.2.1.sif
	rm -f casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz
	rm -f casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz


