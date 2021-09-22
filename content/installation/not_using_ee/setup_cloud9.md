---
date: "2020-08-31T13:25:50-04:00"
menuTitle: Setup Cloud9
pre: <b>▶︎ </b>
title: Setup Cloud9 environment
weight: 20
---

We will be using [CloudShell](https://aws.amazon.com/cloudshell/) to create a new [Cloud9](https://aws.amazon.com/cloud9/) instance to deploy the PetAdoptions application in your AWS account. (If you do not wish to you use Cloud9, skip this page and [go to the next step](/installation/not_using_ee/_deploy_app).)

#### Prerequisites
* In this guide we will be using CloudShell. If you do not wish to use CloudShell, you must already have [installed and configured the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) on your machine to execute the steps in the shell of your choice.
* The default profile must have administrator access to the AWS account.

#### Setup Cloud9 environment

1. In the AWS Management Console on the Services menu, navigate to `CloudShell`. 
2. Copy and past the following commands into the terminal:

```bash
curl -O https://raw.githubusercontent.com/aws-samples/one-observability-demo/main/cloud9-cfn.yaml

aws cloudformation create-stack --stack-name C9-Observability-Workshop --template-body file://cloud9-cfn.yaml --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-create-complete --stack-name C9-Observability-Workshop

echo -e "Cloud9 Instance is Ready!!\n\n"
```

3. Select `Paste` when prompted by CloudShell Safe Paste to continue.

> Safe Paste is a CloudShell security feature that allows you to verify multiline text. Verify that the copied text does not contain malicious scripts before continuing.

![CloudShell Safe Paste](/static/images/cloudshell.png?classes=shadow)

4. After some time, the message "Cloud9 Instance is Ready!!" will output to the terminal. This indicates the successful creation of your Cloud9 environment.