#!/bin/bash

set -x

ENVIRONMENT=prod
TF_PLAN="$ENVIRONMENT".tfplan

[ -d .terraform ] && rm -rf .terraform
rm -f *.tfplan

sleep 2
terraform fmt -recursive
terraform init
terraform validate

if [ "$?" -eq "0" ]
then
   echo "your code is valid"
   echo "the plan can be created succesfully"
   sleep 2
else 
   echo "your code has failed,work onit again"
   exit 1

fi 
 
terraform plan -out=${TF_PLAN}

if [ ! -f "${TF_PLAN}" ]
then
   echo "your plan is invalid,plan failed"
   exit 1
fi 

#terraform apply ${TF_PLAN}
#rm -f *.tfplan