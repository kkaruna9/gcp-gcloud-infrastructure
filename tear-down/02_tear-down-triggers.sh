#!/bin/sh

echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP build tears >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

#gcloud beta builds triggers delete gcp-frontend-trigger -q
#gcloud beta builds triggers delete gcp-backend-trigger -q
gcloud beta builds triggers delete gcp-postbuild-trigger -q
gcloud beta builds triggers delete gcp-prebuild-trigger -q
#gcloud beta builds triggers delete gcp-bvt-trigger -q
gcloud beta builds triggers delete gcp-functional-SmokeTest -q
gcloud beta builds triggers delete gcp-functional-UITest -q
gcloud beta builds triggers delete gcp-functional-APITest -q
gcloud beta builds triggers delete gcp-functional-UIRWDTest -q
gcloud beta builds triggers delete gcp-experience-SecurityTest -q
gcloud beta builds triggers delete gcp-experience-AccessibilityTest -q
gcloud beta builds triggers delete gcp-experience-PerformanceTest -q


if [ $? -eq 0 ]
then
  echo "Deleted All the Triggers Successfully"
else
  echo "Failed to Delete Triggers"
fi
