---
date: "2020-08-29T14:10:29-04:00"
menuTitle: 2.2 Setup Cloud9
title: 2.2 Setup Cloud9
weight: 6
---

![You are here](/images/Slide2.png)

{{% notice info %}}
Cloud9 typically manages IAM credentials dynamically. Because we want to have a specific IAM role for EKS, we will be turning off this functionality.
{{% /notice %}}

{{% notice warning %}}
Note that AWS often updates the console experience, and the screenshots included here may differ slightly from what you experience. Ask an AWS event helper if you have any trouble.
{{% /notice %}}

### Disable AWS managed temporary credentials
1. In the AWS Management Console on the Services menu, click `Cloud9`.
2. Click `Open IDE` on the `observabilityworkshop` Cloud9 instance.

3. Click the gear icon in the top right to open the `Prefences` tab.
4. Select `AWS SETTINGS` from the left navigation menu.
5. Toggle off the `AWS managed temporary credentials` setting.
6. Close the `Preferences` tab.
![c9disableiam](/images/c9disableiam.png)


### Attach IAM Instance Profile
7. Select `Manage EC2 Instances` on the User details in the top right corner:

![manageEC2Instance](/images/manageec2.png)

8. Select the Cloud9 EC2 instance, then `Modify IAM role`.

![cloud9ModifyRole](/images/cloud9modifyRole.png)

9. Select the IAM Role `observabilityworkshop-profile` from the list and click Save.

![cloud9ModifyRole2](/images/cloud9modifyRole2.png)

### Remove temporary credentials
10. Navigate to the terminal at the bottom of the screen. (If you do not see  a terminal, click `Window` from the top menu, then `New Terminal`).

11. Execute the following command in the terminal:
> This script ensures that no temporary credentials are already in place by removing any existing credentials file. 
```bash
rm -vf ${HOME}/.aws/credentials
```

### Install tools

12. Execute the following command in the terminal:
> This script installs all the necessary tools and utilities required. It also downloads the source code required for the workshop.

```bash
curl -sSL https://raw.githubusercontent.com/aws-samples/one-observability-demo/main/PetAdoptions/envsetup_ee.sh | bash -s stable
```

### Configure AWS CLI with the current AWS Region as default:

13. Execute the following commands in the terminal:

> This script configures the AWS CLI to use the current region as the default.

```bash
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure get default.region
```

### Validate environment settings

14. Execute the following commands in the terminal:

> This script validates that your environment settings are correct.

```bash
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set

aws sts get-caller-identity --query Arn | grep observabilityworkshop-admin -q && echo "You're good. IAM role IS valid." || echo "IAM role NOT valid. DO NOT PROCEED."
```

### Install CDK packages
15. Once cloned successfully, execute the following command in the terminal:
> This command will navigate you to the `pet_stack` folder.

```bash
cd workshopfiles/one-observability-demo/PetAdoptions/cdk/pet_stack
```

### Update kubeconfig
16. Execute the following commands in the terminal:
> These commands update kubeconfig so you can interact with the EKS cluster

```bash
aws eks update-kubeconfig --name PetSite --region $AWS_REGION            
kubectl get nodes
```

After execution, your output should look like the screenshot below:
![Kubeconfig](/images/eksconfigured.png)

You have now successfully set up your Cloud9 environment! Now let's use this environment to fetch the URL for the pet adoption website. Execute the following command:

```bash
aws ssm get-parameter --name '/petstore/petsiteurl'  | jq -r .Parameter.Value
```

And now open this URL in a new tab of your web browser. You will then see a page like this one:

![Pet adoption site landing page](/images/installation/petsite1.png)
