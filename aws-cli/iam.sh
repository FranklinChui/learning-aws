#!/usr/bin/env bash
exit

aws iam create-user --user-name <a name>
aws iam get-user --user-name <a name>

aws iam create-group --group-name Group1
aws iam add-user-to-group --user-name jgold --group-name Group1

aws iam list-groups
aws iam list-groups-for-user --user-name jgold

aws iam create-login-profile --user-name jgold --password 123456asdf --password-reset-req


aws iam create-group --group-name Group3

aws iam add-user-to-group --user-name jgold --group-name Group3
aws iam list-groups-for-user --user-name jgold

###
aws iam list-users
aws iam list-policies
aws iam attach-user-policy --user-name jgold \
  --policy-arn arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess
aws iam list-attached-user-policies --user-name jgold
aws iam list-attached-group-policies --group-name Group3
aws iam list-groups-for-user --user-name jgold

