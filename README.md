
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

## Working with Data

Singularity automatically mounts the current working directory (PWD) inside the container at the same path, allowing you to easily access and work with your local data. By default, Singularity changes to the `$HOME` directory when a container starts. To make it stay in the PWD, use the `--pwd` flag:

```bash
singularity exec --pwd $(pwd) casa_6.4.1.sif your_command
```

### Mounting PWD to Container and Setting as Initial Working Directory

If your current working directory (PWD) is different from `$HOME`, you can use the `--bind` and `--pwd` flags together to both mount the PWD and set it as the initial working directory:

```bash
singularity exec --bind $PWD:$PWD --pwd $(pwd) casa.sif your_command
```

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
