#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                         Creating cloud VM Instance                         |
+----------------------------------------------------------------------------+
"
gcloud iam service-accounts list

echo -n "Please setup existing service account and continue (y/n)? "
read san
if [ "$san" != "${san#[Yy]}" ] ;then
    read -p 'Enter Service Account Name :' serviceAccountName
    SA_NAME=$serviceAccountName
else
    red=`tput setaf 1`
    echo  $red ALERT ! Service Account setup is not done.
fi

gcloud beta compute --project=$PROJECT_ID instances create $DEFAULT_CLUSTER_QEA_SERVER --zone=$DEFAULT_ZONE_SERVER --machine-type=e2-standard-8 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=$SA_NAME --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=debian-10-buster-v20210916 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-balanced --boot-disk-device-name=$DEFAULT_CLUSTER_QEA_SERVER --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
sleep 60
gcloud compute instances list
gcloud compute ssh --zone $DEFAULT_ZONE_SERVER $DEFAULT_CLUSTER_QEA_SERVER --project $PROJECT_ID --command 'sudo apt update &&
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &&
sudo apt update &&
sudo apt-cache policy docker-ce &&
sudo apt install docker-ce &&
sudo systemctl status docker &&
sudo docker info &&
sudo docker run -d --name sonarqube -p 6002:9000 sonarqube:7.5-community &&
sudo docker run --name reportingdashboard -p 3337:3337 --rm -i -t -d karthiknarayanpdec11/dashboardgcp:latest &&
 logout
 '
 #sudo docker pull elgalu/selenium &&
 #sudo docker pull dosel/zalenium &&
 # sudo docker run --rm -t -i -d --name zalenium -p 4444:4444 -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/videos:/home/seluser/videos --privileged dosel/zalenium start --desiredContainers 2 &&

gcloud compute firewall-rules create sonar-firewall-rule --allow tcp:6002 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"
gcloud compute firewall-rules create report-firewall-rule --allow tcp:3337 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"
gcloud compute firewall-rules create zalenium-firewall-rule --allow tcp:4444 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"
gcloud compute firewall-rules create zalenium-child-firewall-rule --allow tcp:4445 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"