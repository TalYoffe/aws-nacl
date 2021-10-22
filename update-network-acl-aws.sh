#!/usr/bin/env bash

# This bash script adds a new NACL rule in the given AWS region. The script asks user to enter the NACL rule number, IP address and the allow/deny rule.

# The script is based on the AWS CLI commands. It uses latest version of AWS CLI paired with the Access Key and Secret Keys. The keys should have either Administrator permission, or EC2FullAccess permission. You can also use a granular set of permissions with "CreateNetworkAclEntry" and "DescribeNetworkAcls" Actions.

# The keys should be added to the "~/.aws/credentials" file either manually, or by running "aws configure" command.


# Make sure the script has executable permission. Use this command:
#
#    chmod +x update-network-acl-aws.sh
#



# Run the script using this command:
#
#    bash update-network-acl-aws.sh
#

# Ask the user to enter the Network ACL Rule Number. The NUM is later used in the commands.

read -p "Enter the ACL Rule number: " NUM


# Ask the user to enter the IP Address in CIDR format. The IP_ADDRESS is later used in the commands.

read -p "Enter ip address you want to block: " IP_ADDRESS


# Ask the user whether to add an allow or deny rule in the NACL. The AD is later used in the commands.

read -p "allow or deny: " AD


# AWS Regions

NV=us-east-1
OHIO=us-east-2
CALIFORNIA=us-west-1
OREGON=us-west-2
SYDNEY=ap-southeast-2
FRANKFURT=eu-central-1
## Add new regions here


# Commands to update the NACL in different regions. 


# Northern Virginia region

aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $NV | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $NV


# Ohio region

aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $OHIO | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $OHIO


# Califirnia region

aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $CALIFORNIA | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $CALIFORNIA


# Oregon region

aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $OREGON | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $OREGON


# Sydney region

aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $SYDNEY | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $SYDNEY


# Frankfurt region

aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $FRANKFURT | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $FRANKFURT


## Add the code for the new regions according to requirements. Make sure to add the $<region-name> after --region

## aws ec2 describe-network-acls --query 'NetworkAcls[].[NetworkAclId]' --output text --region $<NEW-REGION> | xargs -I {} aws ec2 create-network-acl-entry --network-acl-id {} --ingress --rule-number $NUM --protocol -1 --port-range From=0,To=65535 --cidr-block $IP_ADDRESS --rule-action $AD --region $<NEW-REGION>

# Replace <NEW-REGION> with the Region Name from above
