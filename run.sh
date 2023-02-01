#!/bin/bash
docker kill geoserver
docker rm geoserver

docker run \
	--privileged \
	--name=geoserver \
    -v $(pwd)/setenv.sh:/usr/local/tomcat/bin/setenv.sh \
	-v $DATA_DIR:/opt/geoserver/data_dir \
	-p 8080:8080 \
	-d \
	-t kartoza/geoserver