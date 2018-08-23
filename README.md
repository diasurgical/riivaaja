# Riivaaja

Docker build system for devilution using the original tools

In order to verify the accuracy of the source code it is nessesery to compile it using the original tool chain. This tool generates a docker [Docker](http://google.com) image that can be used to compile devilution on any platform.

## Running

In order to use it to compile the source simply run the following command from the devilution root folder:
```plain
docker run -v $(pwd):/root/devilution riivaaja/builder
```

## Building a new image

Place the files for VC5sp3 (DevStudio_5.10) and VS6sp3 (VS6_SP3) in the Riivaaja root folder and run the following command:
```plain
docker build -t riivaaja/builder:latest .
docker push riivaaja/builder:latest
```

Not that depending on how you copied your files they may have different casing then what is in the .dockerignore file and you would have to adjust it accordingly.
