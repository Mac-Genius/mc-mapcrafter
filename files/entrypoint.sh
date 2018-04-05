if [ ! -d /data/config ]; then
	mkdir /data/config
fi

if [ ! -f /data/config/mapcrafter.conf ]; then
	cp /data/mapcrafter-template.conf /data/config/mapcrafter.conf
fi

if [ -d /data/worlds/world -a "$MAP" = "true" ]; then
	mapcrafter -c /data/config/$CONFIG
else
	printf "World folder does not exist!"
fi

if [ -d /data/worlds/world -a "$ICONS" = "true" ]; then
	printf "Placing markers...\n"
	mapcrafter_markers -c /data/config/$CONFIG
	if [ ! -d /data/output/static/markers/action ]; then
		mkdir /data/output/static/markers/action
	fi
	if [ ! -d /data/output/static/markers/maps ]; then
		mkdir /data/output/static/markers/maps
	fi
	if [ ! -d /data/output/static/markers/image ]; then
		mkdir /data/output/static/markers/image
	fi
	if [ ! -d /data/output/static/markers/social ]; then
		mkdir /data/output/static/markers/social
	fi
	cp -r /data/icons/action/2x_web/*48dp.png /data/output/static/markers/action/
	cp -r /data/icons/maps/2x_web/*48dp.png /data/output/static/markers/maps/
	cp -r /data/icons/image/2x_web/*48dp.png /data/output/static/markers/image/
	cp -r /data/icons/social/2x_web/*48dp.png /data/output/static/markers/social/
	printf "Complete.\n"
else
	printf "World folder does not exist!"
fi
