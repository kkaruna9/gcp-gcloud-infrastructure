#!/bin/bash
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Tear Firewall Rules >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh

gcloud compute firewall-rules delete sonar-firewall-rule report-firewall-rule salenium-firewall-rule salenium-child-firewall-rule -q
if [ $? -eq 0 ]
then
  echo "Deleted Firewall Rules"
else
  echo "Failed to Delete Firewall Rules"
fi