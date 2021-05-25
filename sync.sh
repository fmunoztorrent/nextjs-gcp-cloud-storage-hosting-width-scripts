#!/bin/bash

while getopts b:f: flag
do
    case "${flag}" in
        b) bucket=${OPTARG};;
        f) folder=${OPTARG};;
    esac
done

BUCKET_NAME=$bucket
FOLDER_TO_SYNC=$folder

echo "gsutil rsync -R $FOLDER_TO_SYNC gs://$BUCKET_NAME"
