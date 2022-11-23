#FROM tumgis/3dcitydb-web-map
FROM node:16
LABEL email="bonhyeon.gu@9bon.org"
LABEL name="BonhyeonGu"

WORKDIR /usr/src/app
RUN apt-get update
RUN apt-get install -y git nano tzdata

RUN git clone https://github.com/BonhyeonGu/3dcityWebLab 3dcity

WORKDIR /usr/src/app/3dcity
RUN export NODE_OPTIONS=--max_old_space_size=16384
RUN npm install
RUN mkdir data
CMD [ "node", "server.js", "--public"]
