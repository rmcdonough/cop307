---
description: sdfsdf
menuTitle: Explore Container Insights
title: Explore Container Insights on ECS
weight: 1
---

The following architecture diagram illustrates the ECS Container Insights portion of the PetAdoptions application. PetAdoptions' ECS services use [AWS FireLens](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html) to collect logs and metrics in [Embedded Metric Format (EMF)](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Embedded_Metric_Format.html) and send that information over to CloudWatch.

![Architecture](/static/images/containerinsights/cwci-ecs-arch.png)

### Verify that ECS Container Insights is enabled
The PetAdoptions application uses an ECS Fargate cluster. Container Insights has already been enabled on this cluster, and we will verify this with the following steps. 

::alert[Click [here](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html) for additional documentation on how to enable Container Insights.]{type="info"}

1. In the AWS Management Console on the Services menu, navigate to `Elastic Container Service`.
2. Click on the cluster that begins with `Services-PetSearch`.
3. Copy the text listed next to  `Cluster:`. This is the name we will be using in a later step.
4. In the command below, **replace** `<cluster-name>` with the name of the cluster you just copied, and execute the command in the Cloud 9 terminal:

::alert[[Setup Cloud9](/installation/using_ee/_setup_cloud9) in case you did not do that already]{type="info"}

```bash
aws ecs describe-clusters --clusters <cluster-name> | jq '.clusters[0].settings'
```

You should see a result similar to the one below.

```json
[
  {
    "name": "containerInsights",
    "value": "enabled"
  }
]
```

6. Execute the following command in the terminal:
> Running this command will show you a list of ECS clusters in the ECS Console.

```bash
aws ecs list-clusters | jq '.clusterArns[]' -r
```

This concludes this section. You may continue on to the next section.