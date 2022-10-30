FROM tumgis/3dcitydb-web-map
LABEL email="bonhyeon.gu@9bon.org"
LABEL name="BonhyeonGu"

WORKDIR /
USER root
RUN apt-get update
RUN apt-get install -y git
RUN git config --global http.sslVerify false
RUN git clone https://github.com/BonhyeonGu/3dcityWebLab
RUN ls -al /var/www/data/
RUN cp -rf /3dcityWebLab/* /var/www
RUN ls -al /var/www/data/

WORKDIR /var/www
USER node
EXPOSE <web outport>
CMD [ "node", "server.js", "--public"]