#!/usr/bin/env bash 
exit


# search sns subscriptions by endpoint
aws sns list-subscriptions \
  --query 'Subscriptions[?contains(Endpoint,`dev`) == \`true\` ][Endpoint, TopicArn]' 
  --output table

# search alarms by sns topic
aws cloudwatch describe-alarms --query 'MetricAlarms[?contains(AlarmActions, `something`) == `true`][AlarmName, AlarmActions]' --output table --max-items 10

# Get stack outputs
aws cloudformation describe-stacks --query 'Stacks[0].Outputs' --output table --stack-name $stackname --profile $profile

# Get stack outputs from multiple stacks
aws cloudformation describe-stacks --query '*[?contains(StackName, `Git`)] | [].{ StackName: StackName, Outputs: Outputs}' --profile dhishrdsvcprod

# Get api gateway by id
aws apigateway get-rest-apis --profile dhishrdsvcprod --query 'items[?starts_with(id, `j3j5hmnqm5`)]'

# Get Available network interfaces id's
aws ec2 describe-network-interfaces --profile dhishrdsvcdev --filters Name=status,Values=available --query NetworkInterfaces[*].[NetworkInterfaceId] --output text

# Get subnet availability zone associations (identify the underlying datacenter for an az by subnet)
aws ec2 describe-subnets --query 'Subnets[?AvailabilityZoneId==`use1-az3`][AvailabilityZoneId, AvailabilityZone]' --output table

# Get lambda functions by runtime
aws lambda list-functions --query 'sort_by(Functions[?Runtime==`python3.6`||Runtime==`python3.7`], &Runtime)[][FunctionName, Runtime]' --output table --max-items 1000

# List all S3 pending multipart uploads in account
for bucket in $(aws s3api list-buckets --query 'Buckets[*].Name' --output text --region us-west-2); do 
  print $bucket; aws s3api list-multipart-uploads \
    --bucket $bucket \
    --query 'Uploads && length(Uploads)'; 
done;

