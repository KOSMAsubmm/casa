
#!/bin/bash

# Ensure local access to the X server
xhost +local:

# Run the Singularity container
singularity run --bind $PWD:/data name_of_your_container.sif
