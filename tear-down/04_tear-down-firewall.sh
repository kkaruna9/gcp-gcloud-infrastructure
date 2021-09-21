#!/bin/bash
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Tear Firewall Rules >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
gcloud compute firewall-rules delete sonar-firewall-rule report-firewall-rule zalenium-firewall-rule
if [ $? -eq 0 ]
then
  echo "Deleted Firewall Rules"
else
  echo "Failed to Delete Firewall Rules"
fi