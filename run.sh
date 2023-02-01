#!/bin/bash
docker kill geoserver
docker rm geoserver

DATA_DIR=/geoserver_data
if [ ! -d $DATA_DIR ]
then
    mkdir -p $DATA_DIR
fi 

docker run \
	--privileged \
	--name=geoserver \
    -v $(pwd)/setenv.sh:/usr/local/tomcat/bin/setenv.sh \
	-v $DATA_DIR:/opt/geoserver/data_dir \
	-p 8080:8080 \
	-d \
	-t kartoza/geoserver