#!/usr/bin/env bash
exit

### aws vpn
aws ec2 describe-vpn-gateways
aws ec2 create-customer-gateway ...

aws ec2 create-vpn-connection --type ipsec.1 \
--customer-gateway-id <id> \
--vpn-gateway-id <id>

###
aws ec2 describe-vpcs
aws ec2 create-network-acl --vpc-id vpc-03783d9d26b93b70a

aws ec2 create-tags \
  --resources acl-00c6fc8a7b971261b \
  --tags Key=Name,Value=NetACL1

# ingress for inbound, egress for outbound
aws ec2 create-network-acl-entry \
  --network-acl-id acl-00c6fc8a7b971261b \
  --ingress \
  --rule-number 100 \
  --protocol tcp \
  --port-range From=22,To=22 \
  --cidr-block 0.0.0.0/0 \
  --rule-action allow

aws ec2 describe-network-acls \
  --query 'NetworkAcls[*].{Vpcid:VpcId,NetAclId:NetworkAclId}'

###
aws ec2 describe-vpcs --query 'Vpcs[*].{VpcID:VpcId}'
aws ec2 create-security-group \
  --group-name SecurityGrp2 \
  --description "Security Group 2" \
  --vpc-id vpc-03783d9d26b93b70a
aws ec2 describe-security-groups

aws ec2 create-tags \
  --resources sg-048ee11111098746d \
  --tags Key=Name,Value=SecGroup2
  
aws ec2 describe-security-groups \
  --query 'SecurityGroups[?GroupId==`sg-048ee11111098746d`]'  

aws ec2 authorize-security-group-ingress \
  --group-id sg-0b997d4e98e2777de \
  --protocol tcp \
  --port 3389 \
  --cidr 200.0.119.0/24

