---
date: "2020-05-26T10:40:36-04:00"
menuTitle: Using Metrics
title: Using Metrics
weight: 3
---

#### Metrics

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu, click on `Metrics`.
3. In the `All metrics` tab under `Custom Namespaces`, click on the namespace called `ContainerInsights`.

> This is a custom AWS Namespace where all the metrics from all EKS clusters collected by CloudWatch Container Insights in the selected region are grouped together. 

You should see the different metric types as shown below.

![EKS Metrics](/images/containerinsights/eks6.png?classes=shadow)

4. Click on the `ClusterName, Namespace, PodName` metric category.
5. Select a couple of metrics in the list by checking the checkboxes. 

You should see them appear on the graph as shown below.

![EKS Metrics](/images/containerinsights/eks7.png?classes=shadow)

> From this console, you can select a particular metric and perform metric operations such as creating dashboards, alarms, and anomaly detection models.

This concludes this section. You may continue on to the next section.
