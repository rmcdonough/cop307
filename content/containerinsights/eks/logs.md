---
date: "2020-05-26T16:54:21-04:00"
menuTitle: Logs
title: Logs from EKS cluster
weight: 4
---

The PetAdoptions EKS Logs are collected by the fluentd daemonset running in the EKS nodes. The CloudWatch log groups that we will be interacting with today were automatically created by Container Insights when it was configured. They are appear in the console with the following syntax:

- `/aws/containerinsights/*cluster-name*/application`
- `/aws/containerinsights/*cluster-name*/dataplane`
- `/aws/containerinsights/*cluster-name*/host`
- `/aws/containerinsights/*cluster-name*/performance`


1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu under `Logs`, click on `Log groups`.
3. In the `Filter log groups` search bar, type in `petsite`.

![EKS Container Insights Log Groups](/images/containerinsights/eks8.png?classes=shadow)

4. Click on the log group that ends with `performance`.

> This will take you to a page that shows you the different log streams within the log group.

5. Select the first log stream by clicking the name.

> You should see performance logs originating from the node.

6. Type `CloudWatchMetrics` (case sensitive) into the `Filter events` search box.

7. Click on an arrow from the first column in the table to expand a log.

Your screen should look similar to the screenshot below. From here you can view and analyze the metric log data.

![EMF Log event](/images/containerinsights/eks9.png?classes=shadow)

{{% notice tip %}}
Container Insights uses [Embedded Metric Format](https://aws.amazon.com/about-aws/whats-new/2019/11/amazon-cloudwatch-launches-embedded-metric-format/) to publish metrics into CloudWatch by way of CloudWatch logs. This allows for easy, arbitrary creation of custom metrics in CloudWatch metrics.
{{% /notice %}}

### Using Logs Insights to query log data

CloudWatch Logs Insights supports a query language that you can use to perform queries on your log groups.

{{% notice tip %}}
Visit the [Logs Insights module](/logsinsights.html) for a deeper dive on this topic.
{{% /notice %}}

8. In the left navigation menu under `Logs`, click on `Insights`.
9. Click the `select log group(s)` search/drop-down and type `petsite`.
10. Select the log group `/aws/containerinsights/PetSite/application`.
11. Delete the query that is already in the query editor and copy and paste in the following query: 

```bash
fields @timestamp, @message
| filter @message like 'puppy'
| sort @timestamp desc
| limit 200
```

> Running the query above returns log data that contains the string `puppy` in the log message.

![EKS LogInsightsQuery](/images/containerinsights/eks10.png?classes=shadow)

This concludes this section. You may continue on to the next section.
