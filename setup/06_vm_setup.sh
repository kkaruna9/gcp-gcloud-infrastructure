#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                         Creating cloud VM Instance                         |
+----------------------------------------------------------------------------+
"
gcloud iam service-accounts list

: '
echo -n "Please setup existing service account and continue (y/n)? "
read san
if [ "$san" != "${san#[Yy]}" ] ;then
    read -p "Enter Service Account Name :" serviceAccountName
    SA_NAME=$serviceAccountName
else
    red=`tput setaf 1`
    echo  $red ALERT ! Default Service Account is setup - which is created during project creation.
    red=`tput setaf 15`
fi: '

#sleep 60
gcloud beta compute --project=$PROJECT_ID instances create $DEFAULT_CLUSTER_QEA_SERVER --zone=$DEFAULT_ZONE_SERVER --machine-type=e2-standard-8 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=$SERVICE_ACCOUNT --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=debian-10-buster-v20210916 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-balanced --boot-disk-device-name=$DEFAULT_CLUSTER_QEA_SERVER --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

bash -c external_vmip="";
while [ -z $external_vmip ];
do echo "Please Wait - VM Instance  is Loading...";
external_vmip=$(gcloud compute instances list --filter="name ~ .*gcp-qea-server.*"  --format="value(networkInterfaces[].accessConfigs[0].natIP.notnull().list()      :label=EXTERNAL_IP)");
[ -z "$external_vmip" ] && sleep 15; done; echo "End point ready-" && echo $external_vmip; export endpoint=external_vmip;
gcloud compute instances list
gcloud compute ssh --zone $DEFAULT_ZONE_SERVER $DEFAULT_CLUSTER_QEA_SERVER --project $PROJECT_ID --command 'sudo apt update -y &&
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &&
sudo apt update -y &&
sudo apt-cache policy docker-ce &&
sudo apt install docker-ce -y &&
sudo systemctl status docker &&
sudo docker info &&
sudo docker run -d --name sonarqube -p 6002:9000 sonarqube:7.5-community &&
sudo docker run --name reportingdashboard -p 3337:3337 --rm -i -t -d karthiknarayanpdec11/dashboardgcp:latest &&
sudo docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.141.59 &&
sudo docker run -d --link selenium-hub:hub selenium/node-chrome &&
sudo docker run -d --link selenium-hub:hub selenium/node-chrome &&
sudo docker run -d --link selenium-hub:hub selenium/node-chrome &&
 logout
 '
 #sudo docker pull elgalu/selenium &&
 #sudo docker pull dosel/zalenium &&
 # sudo docker run --rm -t -i -d --name zalenium -p 4444:4444 -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/videos:/home/seluser/videos --privileged dosel/zalenium start --desiredContainers 2 &&

gcloud compute firewall-rules create sonar-firewall-rule --allow tcp:6002 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"
gcloud compute firewall-rules create report-firewall-rule --allow tcp:3337 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"
gcloud compute firewall-rules create salenium-firewall-rule --allow tcp:4444 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"
gcloud compute firewall-rules create salenium-child-firewall-rule --allow tcp:4445 --source-tags=$DEFAULT_CLUSTER_QEA_SERVER --source-ranges=0.0.0.0/0 --description="For testing purpose"