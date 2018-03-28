if [ ! -d /data/config ]; then
	mkdir /data/config
fi

if [ ! -f /data/config/mapcrafter.conf ]; then
	cp /data/mapcrafter-template.conf /data/config/mapcrafter.conf
fi

if [ -d /data/worlds/world ]; then
	mapcrafter -c /data/config/$CONFIG
else
	printf "World folder does not exist!"
fi
