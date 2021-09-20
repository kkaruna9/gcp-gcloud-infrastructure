#!/bin/bash
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Tear Firewall Rules >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
gcloud compute firewall-rules delete sonar-firewall-rule report-firewall-rule zalenium-firewall-rule