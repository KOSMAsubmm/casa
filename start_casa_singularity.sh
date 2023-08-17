
#!/bin/bash

# Ensure local access to the X server
xhost +local:
SINGULARITYENV_LANG=$LANG \
SINGULARITYENV_LANGUAGE=$LANGUAGE \
SINGULARITYENV_LC_ALL=$LC_ALL \
SINGULARITYENV_LC_CTYPE=$LC_CTYPE \
# Run the Singularity container
singularity run \
--bind $PWD:/data \
--bind /dev/fuse:/dev/fuse \
--bind /tmp/.X11-unix:/tmp/.X11-unix \
--bind /usr/share/locale:/usr/share/locale \
--writable-tmpfs \
casa_1.sif 

