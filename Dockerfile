FROM alpine:latest
LABEL MAINTAINER="https://github.com/HackerSM9/sm9-phisher"
WORKDIR /sm9-phisher/
ADD . /sm9-phisher
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./app.sh"
