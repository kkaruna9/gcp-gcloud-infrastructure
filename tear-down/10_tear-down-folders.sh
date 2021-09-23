#!/bin/sh
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Project folders  >>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

rm -rf temp/
rm -rf *
if [ $? -eq 0 ]
then
  echo "Deleted all folders in the current directory"
else
  echo "Deleted all folders in the current directory"
fi