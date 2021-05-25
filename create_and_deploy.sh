#!/bin/bash

while getopts b:f: flag
do
    case "${flag}" in
        b) bucket=${OPTARG};;
        f) folder=${OPTARG};;
    esac
done


PROJECT_ID=""
STORAGE_CLASS="STANDARD"
BUCKET_LOCATION="SOUTHAMERICA-EAST1"
BUCKET_NAME=$bucket
FOLDER_TO_SYNC=$folder

gsutil mb gs://$BUCKET_NAME
gsutil mb -p $PROJECT_ID -c $STORAGE_CLASS -l $BUCKET_LOCATION -b on gs://$BUCKET_NAME
gsutil rsync -R $FOLDER_TO_SYNC gs://$BUCKET_NAME
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME
gsutil web set -m index.html -e 404.html gs://$BUCKET_NAME

