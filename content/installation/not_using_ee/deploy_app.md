---
date: "2020-08-31T14:02:35-04:00"
menuTitle: Deploy Application
pre: <b>▶︎ </b>
title: Deploy Application
weight: 30
---

::alert[We highly recommend using Cloud9 to setup and interact with this workshop. While you can use your own terminal, the steps in this workshop have been tested and optimized to work with Cloud9. If you choose not to use Cloud9, this workshop assumes that you will use an equivalent alternative.]{type="warning"}

### Setup Cloud9 IAM permissions (skip if not using Cloud9)

::alert[Cloud9 normally manages IAM credentials dynamically. At this time, this feature is not compatible with the aws-iam-authenticator plugin, so we will disable it and rely on the IAM role instead.]{type="info"}

1. In the AWS Management Console on the Services menu, click `Cloud9`.
2. Click `Open IDE` on the `observabilityworkshop` Cloud9 instance.
![Cloud9 Instance](/images/c9-openIDE.png?classes=shadow)

3. Click the gear icon in the top right to open the `Prefences` tab.
4. Select `AWS SETTINGS` from the left navigation menu.
5. Toggle off the `AWS managed temporary credentials` setting.
6. Close the `Preferences` tab.
7. Navigate to the terminal at the bottom of the screen. (If you do not see  a terminal, click `Window` from the top menu, then `New Terminal`)

![c9disableiam](/images/c9disableiam.png)

### Remove existing temporary credentials
8. Execute the following command in the terminal:
> This script ensures that no temporary credentials are already in place by removing any existing credentials file. 
```bash
rm -vf ${HOME}/.aws/credentials
```

### Install tools and clone the repository
9. Execute the following command in the terminal:
> This script installs all the necessary tools and utilities required. It also downloads the source code required for the workshop.

```bash
curl -sSL https://raw.githubusercontent.com/aws-samples/one-observability-demo/main/PetAdoptions/envsetup.sh | bash -s stable
```

### Configure AWS CLI with the current AWS Region as default:
10. Execute the following commands in the terminal:

> This script configures the AWS CLI to use the current region as the default.

```bash
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure get default.region
```

### Validate environment settings (skip this if you're not using Cloud9)

::alert[If you are not using Cloud9, skip this step and continue to the [Install CDK packages](#install-cdk-packages) step.]{type="info"} 

11. Execute the following commands in the terminal:

> This script validates that your environment settings are correct.

```bash
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set

aws sts get-caller-identity --query Arn | grep observabilityworkshop-admin -q && echo "You're good. IAM role IS valid." || echo "IAM role NOT valid. DO NOT PROCEED."
```

When using Cloud9, if the IAM role is not valid, <span style="color: red;">**DO NOT PROCEED**</span>. Go back and confirm the steps on this page.

### Install CDK packages
12. Once cloned successfully, execute the following command in the terminal:
> This command will navigate you to the `pet_stack` folder.

```bash
cd workshopfiles/one-observability-demo/PetAdoptions/cdk/pet_stack
```
13. Execute the following command in the terminal:
> This command installs all npm packages.

```bash
npm install
```
### Bootstrap CDK 

14. Execute the following command in the terminal:
> This command installs the Bootstrap CDK.

::alert[If you are not in the `pet_stack` folder go there by executing this - ```cd workshopfiles/one-observability-demo/PetAdoptions/cdk/pet_stack```]{type="info"}

```bash
cdk bootstrap
```

### Add permissions to access EKS Console (optional)
15. Execute the following command in the terminal: (optional)
* Note: Replace `<Enter your Role ARN>` with the ARN of your current AWS Identity.

> A new EKS Console was [recently](https://aws.amazon.com/blogs/containers/introducing-the-new-amazon-eks-console/) introduced by AWS. In order to have full access to the new Console, some permissions needs to be granted inside the EKS Cluster RBAC as described [here](https://docs.aws.amazon.com/eks/latest/userguide/view-workloads.html). This command adds permissions to access the EKS Console. 

```bash
CONSOLE_ROLE_ARN=<Enter your Role ARN>
```


### Deploy the stack

16. Execute the following commands in the terminal:

> These commands deploy the PetAdoptions application stack to your AWS account.

```bash
EKS_ADMIN_ARN=$(../../getrole.sh)

echo -e "\nRole \"${EKS_ADMIN_ARN}\" will be part of system\:masters group\n" 

if [ -z $CONSOLE_ROLE_ARN ]; then echo -e "\nEKS Console access will be restricted\n"; else echo -e "\nRole \"${CONSOLE_ROLE_ARN}\" will have access to EKS Console\n"; fi

cdk deploy --context admin_role=$EKS_ADMIN_ARN Services --context dashboard_role_arn=$CONSOLE_ROLE_ARN --require-approval never

cdk deploy Applications --require-approval never

``` 

It will take a few minutes for the stack to be deployed, so feel free to take a coffee break here <span style=font-size:40px> ☕️ </span>

### Update kubeconfig
17. Execute the following commands in the terminal:
> These commands update kubeconfig so you can interact with the EKS cluster

```bash
aws eks update-kubeconfig --name PetSite --region $AWS_REGION            
kubectl get nodes                                
```

After execution, your output should look like the below screenshot:
![Kubeconfig](/images/eksconfigured.png)

### Explore the web application (optional)

18. Execute the following command in the terminal: 

```bash
aws ssm get-parameter --name '/petstore/petsiteurl'  | jq -r .Parameter.Value
```
19. Navigate to the URL that was returned as a result. You should be see the application home screen as shown below.

![App Home](/images/playaround/home.png)


You can navigate through the application as shown below.

![App Home](/images/playaround/play.gif)

#### Troubleshooting

In very rare cases, you might encounter a behavior where the site does not show any pet images. Click on `Perform Housekeeping` in the PetSite home page upper right corner.
