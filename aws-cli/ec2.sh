#!/usr/bin/env bash
exit

### EBS
aws ec2 create-volume \
  --volume-type gp2 \
  --size 2 \
  --availability-zone us-east-1a
  
aws ec2 create-volume-type \
  --volume-type io1 \
  --iops 1000 \
  --snapshot-id snap-120323810239asdf9 \
  --availability-zone us-east-1a


aws ec2 attach-internet-gateway \
  --vpc-id "vpc-03783d9d26b93b70a" \
  --internet-gateway-id "igw-09ece6ed638520353" \
  --region us-east-1

### EC2
aws ec2 describe-subnets
aws ec2 describe-subnets \
  --query 'Subnets[].{SubnetArn:SubnetArn,SubnetID:SubnetId,Cidr:CidrBlock}'

aws ec2 describe-images \
  --owners amazon \
  --filters "Name=platform,Values=windows" \
  --query "Images[].{Name:Name,ID:ImageId}"
  
aws ec2 describe-security-groups \
  --query "SecurityGroups[].{Name:GroupName,ID:GroupId}"

aws ec2 run-instances \
  --iamge-id ami-0011f8127443adf7c \
  --count 1 \
  --instance-type t2.micro \
  --key-name MyWindwosKeyPair2 \
  --security-group sg-048ee11111098746d \
  --subnet-id subnet-214de847

aws ec2 describes-instances
aws ec2 create-image \
  --instance-id i-0046e8521c975b673 \
  --name "centos7-img" \
  --description "Test image created via cli"
aws ec2 describe-images \
 --owner self

