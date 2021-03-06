FROM debian/stable-slim

MAINTAINER brainstormi

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    usbutils \
    libflac-dev \
    libfaad2  \
    libfaad-dev \
    libmad0 \
    libmad0-dev \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    libvorbis-dev \
    libvo-aacenc-dev \
    libmpg123-dev

RUN git clone https://github.com/ralph-irving/squeezelite.git && cd squeezelite && make && cp squeezelite /usr/bin

CMD squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC -C 1