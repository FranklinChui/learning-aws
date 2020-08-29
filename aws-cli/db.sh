#1/usr/bin/env bash
exit

### RDS
aws rds create-db-instance \
  --db-instance-identifier msql-app1 \
  --db-instance-class db.t3.micro \
  --engine mysql \
  --master-username admin \
  --master-user-password "Pa$$wrdABC123" \
  --allocated-storage 20
  
aws rds describe-db-instances --query "DBInstances[].DBInstanceIdentifier"

aws rds delete-db-instance \
  --db-instance-identifier "msql-app1" \
  --skip-final-snapshot


