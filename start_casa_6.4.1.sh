
#!/bin/bash

# Ensure local access to the X server
xhost +local:
SINGULARITYENV_LANG=$LANG \
SINGULARITYENV_LANGUAGE=$LANGUAGE \
SINGULARITYENV_LC_ALL=$LC_ALL \
SINGULARITYENV_LC_CTYPE=$LC_CTYPE \
# Run the Singularity container
singularity run --bind $PWD:/data --pwd /data /opt/casa_container/casa_6.4.1.sif
