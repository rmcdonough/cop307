---
date: "2020-07-12T12:46:53-04:00"
title: CLEAN UP RESOURCES
weight: 1000
---

## Delete the stack

Open the [AWS Cloud9](https://console.aws.amazon.com/cloud9/home/product) instance (named observability-workshop) and execute the following script to remove all the resources created in this workshop:

```bash
curl https://raw.githubusercontent.com/aws-samples/one-observability-demo/main/PetAdoptions/cdk/pet_stack/resources/destroy_stack.sh | bash
```
## Delete the Cloud9 environment

Open [AWS CloudShell](https://console.aws.amazon.com/cloudshell/home) and execute the following command

```bash
aws cloudformation delete-stack --stack-name C9-Observability-Workshop
```