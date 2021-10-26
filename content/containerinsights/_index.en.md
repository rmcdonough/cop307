---
chapter: true
date: "2020-05-11T09:14:20-04:00"
pre: <b>5. </b>
title: Container Insights
weight: 70
---

![You are here](/images/Slide5.png)

Use CloudWatch Container Insights to collect, aggregate, and summarize metrics and logs from your containerized applications and microservices. Container Insights is available for Amazon Elastic Container Service, AWS Fargate on ECS, Amazon Elastic Kubernetes Service, and Kubernetes platforms on Amazon EC2. The metrics include utilization for resources such as CPU, memory, disk, and network. Container Insights also provides diagnostic information, such as container restart failures, to help you isolate issues and resolve them quickly. You can also set CloudWatch alarms on metrics that Container Insights collects.

The metrics that Container Insights collects are available in CloudWatch automatic dashboards. You can analyze and troubleshoot container performance and logs data with CloudWatch Logs Insights.

Operational data is collected as performance log events. These are entries that use a structured JSON schema that enables high-cardinality data to be ingested and stored at scale. From this data, CloudWatch creates aggregated metrics at the cluster, node, pod, task, and service level as CloudWatch metrics.

In Amazon EKS and Kubernetes, Container Insights uses a containerized version of the CloudWatch agent to discover all the running containers in a cluster. It then collects performance data at every layer of the performance stack.

Container Insights supports encryption with the customer master key (CMK) for the logs and metrics that it collects. To enable this encryption, you must manually enable KMS encryption for the log group that receives Container Insights data. This results in Container Insights encrypting this data using the provided CMK. Only symmetric CMKs are supported. Do not use asymmetric CMKs to encrypt your log groups.

To learn more about Container Insights visit [our documentation here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html) or continue on to the next section.

{{% notice info %}}
From here we have lab modules for both ECS and EKS, however we only expect you to have time enough for one. Given your preference and the limited time available, please select either [ECS](/containerinsights/ecs.html) or [EKS](/containerinsights/eks.html) for the next section.
{{% /notice %}}
