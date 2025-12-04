#!/bin/bash

# Ensure local access to the X server
xhost +local:
APPTAINERENV_LANG=$LANG \
APPTAINERENV_LANGUAGE=$LANGUAGE \
APPTAINERENV_LC_ALL=$LC_ALL \
APPTAINERENV_LC_CTYPE=$LC_CTYPE \
# Run the Apptainer container
apptainer run --bind $PWD:/data --pwd /data /opt/casa_container/casa_6.5.4.sif

