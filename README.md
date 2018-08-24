# Riivaaja

Docker build system for devilution using the original tools.

In order to verify the accuracy of the source code and to generate a binary that is as close as possible to the original one, it is necessary to compile it using the original toolchain. This tool generates a docker image that can be used to compile devilution on any platform with that toolchain.

This build system is used in the devilution CI system as well in order to make sure that all changes can be compiled with the original toolchain.

## Running

In order to use it to compile the source simply run the following command from the devilution root folder:

```plain
docker run -v $(pwd):/root/devilution diasurgical/riivaaja
```

## Building a new image

Place the files for Visual C++ 5 SP3 (DevStudio_5.10) and Visual C++ SP3 (VS6_SP3) in the Riivaaja root folder. Make sure the versions of VC actually support optimizations (Professional and higher).

Then run the following command:

```plain
docker build -t diasurgical/riivaaja:latest .
docker push diasurgical/riivaaja:latest
```

Make sure that all the files needed have the right casing (see the `.dockerignore` file).

## In the future

We aim to expand this to support the following:

- Artifact generation
- Tracking of the "similarity" to the original binary.