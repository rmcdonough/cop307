#!/usr/bin/env bash

#jquery tools to extract json output
sudo yum install -y jq
sudo pip install --upgrade pip
sudo cp /usr/local/bin/pip /usr/bin/ && sudo cp /usr/local/bin/pip3* /usr/bin/

sudo pip install pymongo
sudo yum install git -y

sudo pip install awscli --upgrade --user
sudo pip install boto3

echo -e "[mongodb-org-4.0] \nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/4.0/x86_64/\ngpgcheck=1 \nenabled=1 \ngpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc" | sudo tee /etc/yum.repos.d/mongodb-org-4.0.repo
sudo yum install -y mongodb-org-shell
sudo yum install -y mongodb-org-tools
echo "Mongo shell installed"

wget -c https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem

c9GroupId=`aws ec2 describe-security-groups --query "SecurityGroups[*].GroupId" --filters Name=group-name,Values=*labs-Cloud9* --output text`
aws cloudformation describe-stacks --query 'Stacks[*].Outputs[][]'>jsonData.json


BASHBAK=$HOME/.bashrc

if [ -f "$BASHBAK.bak" ]; then
    rm $BASHBAK
    cp $BASHBAK.bak $BASHBAK
    echo "Bash copied from original"
else
    cp $BASHBAK $BASHBAK.bak
    echo "Bash backed up"
fi

echo "export mongoUser="`jq -r '.[] | select(.OutputKey == "MongoUser") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export mongoPass="`jq -r '.[] | select(.OutputKey == "MongoPassword") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export mongoIp="`jq -r '.[] | select(.OutputKey == "PrivateIp") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export mongoSgId="`jq -r '.[] | select(.OutputKey == "MongoSgId") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export docdbEndpoint="`jq -r '.[] | select(.OutputKey == "ClusterEndpoint") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export docdbUser="`jq -r '.[] | select(.OutputKey == "DocDBUser") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export docdbPass="`jq -r '.[] | select(.OutputKey == "DocDBPassword") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export docdbSgId="`jq -r '.[] | select(.OutputKey == "DocDBSgId") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export clusterendpoint="`jq -r '.[] | select(.OutputKey == "ClusterEndpoint") | .OutputValue' jsonData.json`":27017" >> /home/ec2-user/.bashrc
echo "export username="`jq -r '.[] | select(.OutputKey == "DocDBUser") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc
echo "export password="`jq -r '.[] | select(.OutputKey == "DocDBPassword") | .OutputValue' jsonData.json` >> /home/ec2-user/.bashrc

source /home/ec2-user/.bashrc
[[ ! -z "$c9GroupId" &&  ! -z "$docdbSgId" ]] && update=`aws ec2 authorize-security-group-ingress  --group-id $docdbSgId --protocol tcp --port 27017 --source-group $c9GroupId`
[[ ! -z "$c9GroupId" &&  ! -z "$mongoSgId" ]] && update=`aws ec2 authorize-security-group-ingress  --group-id $mongoSgId --protocol tcp --port 27017 --source-group $c9GroupId`
echo "Security Groups updated for cloud9 access"

