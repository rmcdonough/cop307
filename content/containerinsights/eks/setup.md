---
description: Explore Container Insights on EKS
menuTitle: Explore Container Insights
title: 'Explore Container Insights '
weight: 1
---

The PetAdoptions front-end web application is hosted on an EKS cluster and has CloudWatch Container Insights enabled. (Take a look at the documentation [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-EKS-quickstart.html#Container-Insights-setup-EKS-quickstart-FluentBit) to learn more about CloudWatch Container Insights using Fluentbit.)

::alert[Read this detailed [blog post](https://aws.amazon.com/blogs/containers/fluent-bit-integration-in-cloudwatch-container-insights-for-eks/) to learn about setting up CloudWatch Container Insights on EKS using Fluentbit.]{type="info"}

### Architecture

Below is the architecture diagram that shows the components that are involved in collecting logs and metrics from your EKS environment.

![Architecture](/static/images/containerinsights/cwci-eks-arch-jan31.png)

### Check Container Insights on the cluster
We will start by verifying that the necessary agents have been installed properly.

* Execute the following commands in the Cloud9 terminal provisioned as part of the workshop: 

::alert[[Setup Cloud9](/installation/using_ee/_setup_cloud9) in case you did not do that already]{type="info"}

> This command creates a kubeconfig for Amazon EKS

```bash
aws eks update-kubeconfig --name PetSite
```

> This command checks to make sure that the CloudWatch and FluentD agents have been installed properly.

```bash
kubectl get pods -n amazon-cloudwatch
```

Your output should be similar to the one below.

```
NAME                                  READY   STATUS    RESTARTS   AGE
cloudwatch-agent-fnh25                1/1     Running   0          172m
cloudwatch-agent-tfgk7                1/1     Running   0          172m
cwagent-prometheus-5bbf77558b-sqkfm   1/1     Running   0          172m
fluent-bit-7p67r                      1/1     Running   0          172m
fluent-bit-cqphf                      1/1     Running   0          172m
```

### Fluentbit dashboard

A Dashboard for Fluentbit metrics is created as part of the deployment and can be accessed [here](https://console.aws.amazon.com/cloudwatch/home?#dashboards\:name=EKS_FluentBit_Dashboard). 

::alert[If you want to learn more about Cloudwatch Dashboards, be sure to check out [this](/dashboards) section.]{type="info"}


![Fluentbit_dashboard](/static/images/containerinsights/fluentbitdashboard.png)