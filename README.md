# Riivaaja

Docker build system for devilution using the original tools.

In order to verify the accuracy of the source code and to generate a binary that is as close as possible to the original one, it is necessary to compile it using the original toolchain. This tool generates a docker image that can be used to compile devilution on any platform with that toolchain.

This build system is used in the devilution CI system as well in order to make sure that all changes can be compiled with the original toolchain and also calculate the accuracy of the binary.

## Running

In order to use it to compile the source simply run the following command from the devilution root folder:

```plain
docker run -v $(pwd):/root/devilution diasurgical/riivaaja
```

To have it generate a pdb file for use with [Devilution-comparer](https://github.com/diasurgical/devilution-comparer) simply set the MAKE_BUILD enviroment variable to "pdb":

```plain
docker run -v $(pwd):/root/devilution -e MAKE_BUILD=pdb diasurgical/riivaaja
```

## Building a new image

Place the files for Visual C++ 5 SP3 (DevStudio_5.10) and Visual C++ SP5 PP5 (VS6) in the Riivaaja root folder. Make sure the versions of VC actually support optimizations (Professional and higher). Optionally use Devilution-comparer to generate a orig_full.asm and put it in the root to allow Riivaaja to generate a project status.

Then run the following command:

```plain
docker build -t diasurgical/riivaaja:latest .
docker push diasurgical/riivaaja:latest
```

Make sure that all the files needed have the right casing (see the `.dockerignore` file).

## In the future

We aim to expand this to support the following:

- Artifact generation
