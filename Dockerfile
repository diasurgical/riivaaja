FROM alpine:edge

RUN echo "x86" > /etc/apk/arch \
    && apk add --update --no-cache make wine freetype libpng

COPY ./ /root/
COPY ./VS6/Common/MSDev98/Bin/MSPDB60.DLL /root/VS6/VC98/Bin/
COPY ./DevStudio_5.10/SharedIDE/bin/MSDIS100.DLL /root/DevStudio_5.10/VC/bin/
COPY ./DevStudio_5.10/SharedIDE/bin/MSPDB50.DLL /root/DevStudio_5.10/VC/bin/

WORKDIR "/root/devilution"

CMD make -f MakefileVC
