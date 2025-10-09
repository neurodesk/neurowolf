# NeuroWolf

## Summary

The main task is to take each of the four recipes from NeuroDesk (https://neurodesk.org/) and convert them to using Wolfi (https://github.com/wolfi-dev) rather than their current base image.

This will involve...

- Configuring a Wolfi CI system for automated recipe builds.
- Publishing the container packages.
- Running test builds of all four containers.
- Testing the functionality of built containers.

## Recipes

Repository: https://github.com/neurodesk/neurocontainers

### QSMXT

**Recipe URL:** `recipes/qsmxt/build.yaml`

### Freesurfer

**Recipe URL:** `recipes/freesurfer/build.yaml`

### Nipype

**Recipe URL:** `recipes/nipype/build.yaml`

### Metabody

**Recipe URL:** `recipes/metabody/build.yaml`

## Scope

The images currently rely on a series of dependencies not included in Wolfi. The main task of the project is implementing recipes for these dependencies and setting up the recipes for automatic build and deployment.

## Background

### Build Process

Currently containers are built from YAML recipe files stored in the neurocontainers repo. The builder is written in Python but in the process of being rewritten in Golang (https://github.com/neurodesk/builder). The containers are built with a GitHub Actions pipeline first building a Docker container then converting it into a Apptainer (https://apptainer.org/) container file.