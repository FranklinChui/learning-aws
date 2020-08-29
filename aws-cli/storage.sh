#!/usr/bin/env bash
exit 


###
aws glacier upload-archive \
  --account-id <accid> \
  --vault-name Vault1 \
  --body File.txt

aws s3 cp s3://bucket448888/LicenseKey.txt \
  s3://bucket448888/LicenseKey.txt \
  --storage-class GLACIER  
  
aws s3api create-bucket \
  --bucket my-useast1-bucket01 \
  --region us-east-1
#  --create-bucket-configuration locationconstraint=eu-west-1
aws s3api list-buckets
aws s3api list-buckets --query 'Buckets[?Name==`my-useast1-bucket01`]'
aws s3api list-buckets --query 'Buckets[].Name'

###
aws s3 cp /tmp/samplefiles s3://my-useast1-bucket01/ \
  --recursive \
  --exclude "*" \
  --include "*log"
aws s3 ls s3://my-useast1-bucket01/Projects/

