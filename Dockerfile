FROM ubuntu

WORKDIR /tmp

# Create directories
RUN mkdir /data && \
	mkdir /data/worlds

# Install mapcrafter
RUN apt-get update && \
	apt-get install -y lsb-core wget apt-transport-https git && \
	ln -s /usr/bin/python3 /usr/bin/python && \
	echo "deb http://packages.mapcrafter.org/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/mapcrafter.list && \
	wget -O /etc/apt/trusted.gpg.d/mapcrafter.gpg http://packages.mapcrafter.org/ubuntu/keyring.gpg && \
	apt-get update && \
	apt-get install -y mapcrafter

# Setup directories

WORKDIR /data

RUN git clone https://github.com/google/material-design-icons.git icons

COPY files/entrypoint.sh /data/entrypoint.sh
COPY files/mapcrafter-template.conf /data/mapcrafter-template.conf

ENV CONFIG=mapcrafter.conf
ENV MAP="true"
ENV ICONS="false"

ENTRYPOINT [ "bash", "entrypoint.sh" ]
