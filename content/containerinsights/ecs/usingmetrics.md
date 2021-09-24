---
date: "2020-05-26T22:42:19-04:00"
menuTitle: Using Metrics
title: Using Metrics
weight: 3
---

::alert[For a CloudWatch Metrics deep dive with a complete hands-on experience on the topic, visit the [Metrics module](/metrics).]{type="info"}

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu, click on `Metrics`.
3. In the `All metrics` tab under `Custom Namespaces`, click on the namespace called `ECS/ContainerInsights`.

> This is a custom AWS Namespace where all of the metrics from all of the ECS clusters collected by CloudWatch Container Isights in the selected region are grouped together. 

You should see the different metric types as shown below.

::alert[If you have a cluster that uses the EC2 launch type, you can also [enable the CloudWatch Agent to collect metrics at instance level](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/deploy-container-insights-ECS-instancelevel.html).]{type="info"}
 
![ECS Metrics](/images/containerinsights/ecs1.png?classes=shadow)

4. Click on the `ClusterName, ServiceName` metric category.
5. Select a couple of metrics in the list by checking the checkboxes. 

You should see them appear on the graph as shown below.

![ECS Metrics](/images/containerinsights/ecs2.png?classes=shadow)

> From this console, you can select a particular metric and perform metric operations such as creating [Dashboards](/dashboards), [Alarms](/alarms), and [Anomaly Detection](/anomalydetection) models.

This concludes this section. You may continue on to the next section.
