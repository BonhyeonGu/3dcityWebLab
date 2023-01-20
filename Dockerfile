#FROM tumgis/3dcitydb-web-map
FROM node:16
LABEL email="bonhyeon.gu@9bon.org"
LABEL name="BonhyeonGu"

ENV TZ=Asia/Seoul
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt -y dist-upgrade && apt-get install -y nvidia-cuda-toolkit

RUN echo $TZ > /etc/timezone && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

WORKDIR /usr/src/app
RUN apt-get update
RUN apt-get install -y git nano tzdata

RUN git clone https://github.com/BonhyeonGu/3dcityWebLab 3dcity

WORKDIR /usr/src/app/3dcity
RUN export NODE_OPTIONS=--max_old_space_size=16384
RUN npm install
RUN mkdir data
CMD [ "node", "server.js", "--public"]
