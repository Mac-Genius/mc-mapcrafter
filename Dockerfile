FROM ubuntu

WORKDIR /tmp

# Install mapcrafter
RUN apt-get update && \
	apt-get install -y lsb-core wget apt-transport-https && \
	ln -s /usr/bin/python3 /usr/bin/python && \
	echo "deb http://packages.mapcrafter.org/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/mapcrafter.list && \
	wget -O /etc/apt/trusted.gpg.d/mapcrafter.gpg http://packages.mapcrafter.org/ubuntu/keyring.gpg && \
	apt-get update && \
	apt-get install -y mapcrafter

# Setup directories

RUN mkdir /data && \
	mkdir /data/worlds

WORKDIR /data

COPY files/entrypoint.sh /data/entrypoint.sh
COPY files/mapcrafter-template.conf /data/mapcrafter-template.conf

ENV CONFIG=mapcrafter.conf

ENTRYPOINT [ "bash", "entrypoint.sh" ]
