FROM rsmoorthy/wine-alpine

RUN apk add --update --no-cache make

COPY ./ /root/
COPY ./VS6/COMMON/MSDEV98/BIN/MSPDB60.DLL /root/VS6/VC98/BIN/

WORKDIR "/root/devilution"

CMD make -f MakefileVC
