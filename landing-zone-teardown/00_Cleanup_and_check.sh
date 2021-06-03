rm -rf gcp-gcloud-infrastructure
rm -rf gcpworkshop-code-repos
rm -rf click-to-deploy/
rm -rf temp


gcloud beta runtime-config configs delete $DEFAULT_CONFIG_NAME