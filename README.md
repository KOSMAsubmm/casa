
# CASA Container

This repository contains the necessary files to build containerized environments for running different versions of [CASA](https://casadocs.readthedocs.io/en/stable/index.html).

## Container Details

- **Base Image**: Ubuntu 22.04
- **CASA Versions**: 
  - 6.4.1 (Refer to `casa_6.4.1_singularity.def`)
  - 6.2.1 (Refer to `casa_6.2.1_singularity.def`)

## Makefile Usage

The Makefile contains several targets for building and running the CASA containers:

### General

- `make all`: Build both 6.4.1 and 6.2.1 Singularity images.

### CASA Version 6.4.1

- `make casa_6.4.1.sif`: Build Singularity image for CASA 6.4.1.

### CASA Version 6.2.1

- `make casa_6.2.1.sif`: Build Singularity image for CASA 6.2.1.

### Downloads

- `make casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz`: Download CASA 6.4.1.
- `make casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz`: Download CASA 6.2.1.

## Quick Start

1. Clone the repository.
2. Run `make all` to build both Singularity images.
3. Use the `.sif` files as needed for your CASA tasks.


## Running the CASA Containers

To run the Singularity containers for the respective CASA versions, you can use the following commands:

### CASA Version 6.4.1

```bash
singularity run casa_6.4.1.sif
```

### CASA Version 6.2.1

```bash
singularity run casa_6.2.1.sif
```

## Working with Data

Singularity automatically mounts the current working directory (PWD) inside the container at the same path. This allows you to easily access and work with your local data.

## Best Practices for Running Alternative Commands

### Overriding the CASA Command

To run an external script using CASA, you can use the `-c` flag like so:

```bash
singularity exec casa_6.4.1.sif casa -c 'execfile("your_script.py")'
```

### Running Custom Commands

You can run any command inside the container by prefixing it with `singularity exec`:

```bash
singularity exec casa_6.4.1.sif your_command
```
