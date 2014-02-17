#!/bin/bash

FOLDER_NAME=$1
BASE_PATH="/media/android-fuse/"
FOLDER_PATH=$BASE_PATH$FOLDER_NAME

echo "folder path: $FOLDER_PATH"

if [ ! -d "$BASE_PATH" ]; then
	echo "Fatal Error: $BASE_PATH does not exist, please create and re-run this script"
	exit 1
fi

if [ "$FOLDER_NAME" = "" ]; then
	echo "Fatal Error: Please enter a folder name to mount the device under as parameter 1"
	exit 2
fi

if [ ! -d "$FOLDER_PATH" ]; then
	mkdir -p "$FOLDER_PATH"
	if [ $? -ne 0 ]; then
		echo "Fatal Error: Failed to create a folder at $FOLDER_PATH"
		exit 4
	else
		echo "created a new folder at $FOLDER_PATH"
	fi
fi

if [ ! "$(ls -A $FOLDER_PATH | wc -l)" == 0 ]; then
	echo "Fatal Error: The target folder is not empty, please clear it out and try again"
	exit 3
fi

chown -R $USER $FOLDER_PATH
chmod -R 700 $FOLDER_PATH

echo "Mounting android fuse filesystem at $FOLDER_PATH"
go-mtpfs $FOLDER_PATH


