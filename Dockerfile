FROM rsmoorthy/wine-alpine

RUN apk add --update --no-cache make

COPY ./ /root/

WORKDIR "/root/devilution"

CMD make -f MakefileVC
