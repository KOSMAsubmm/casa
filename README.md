
# CASA Container

This repository contains the necessary files to build containerized environments for running different versions of [CASA](https://casadocs.readthedocs.io/en/stable/index.html).

## Container Details

- **Base Image**: Ubuntu 22.04
- **CASA Versions**: 
  - 6.5.4 (Refer to `casa_6.5.4_apptainer.def`)
  - 6.4.1 (Refer to `casa_6.4.1_apptainer.def`)
  - 6.2.1 (Refer to `casa_6.2.1_apptainer.def`)

## Makefile Usage

The Makefile contains several targets for building and running the CASA containers:

### General

- `make all`: Build all CASA Apptainer images (6.5.4, 6.4.1, and 6.2.1).

### CASA Version 6.5.4

- `make casa_6.5.4_pipeline.sif`: Build Apptainer image for CASA 6.5.4.

### CASA Version 6.4.1

- `make casa_6.4.1_pipeline.sif`: Build Apptainer image for CASA 6.4.1.

### CASA Version 6.2.1

- `make casa_6.2.1.sif`: Build Apptainer image for CASA 6.2.1.

### Downloads

- `make casa-6.4.1-12-pipeline-2022.2.0.64-py3.6.tar.xz`: Download CASA 6.4.1.
- `make casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz`: Download CASA 6.2.1.

## Build Requirements

Building Apptainer containers requires either:
- **sudo access** (default): The Makefile uses `sudo` by default for building containers
- **Unprivileged build setup**: If you don't have sudo access, you need:
  - The `uidmap` package installed (provides `newuidmap` utility)
  - Proper user namespace configuration
  - Build without sudo: `make APPTAINER_SUDO= all`

## Quick Start

1. Clone the repository.
2. Run `make all` to build all Apptainer images (requires sudo by default).
3. Use the `.sif` files as needed for your CASA tasks.

### Building Without Sudo

If you have the `uidmap` package installed and proper user namespace setup, you can build without sudo:

```bash
make APPTAINER_SUDO= all
```

If you encounter the error `newuidmap was not found in PATH`, install the `uidmap` package:

```bash
sudo apt install uidmap
```

## Working with Data

Apptainer automatically mounts the current working directory (PWD) inside the container at the same path, allowing you to easily access and work with your local data. By default, Apptainer changes to the `$HOME` directory when a container starts. To make it stay in the PWD, use the `--pwd` flag:

```bash
apptainer exec --pwd $(pwd) casa_6.4.1.sif your_command
```

### Mounting PWD to Container and Setting as Initial Working Directory

If your current working directory (PWD) is different from `$HOME`, you can use the `--bind` and `--pwd` flags together to both mount the PWD and set it as the initial working directory:

```bash
apptainer exec --bind $PWD:$PWD --pwd $(pwd) casa.sif your_command
```

## Best Practices for Running Alternative Commands

### Overriding the CASA Command

To run an external script using CASA, you can use the `-c` flag like so:

```bash
apptainer exec casa_6.4.1.sif casa -c 'execfile("your_script.py")'
```

### Running Custom Commands

You can run any command inside the container by prefixing it with `apptainer exec`:

```bash
apptainer exec casa_6.4.1.sif your_command
```
