---
date: "2020-05-26T22:41:40-04:00"
menuTitle: Logs
title: Logs
weight: 4
---

The CloudWatch log groups that we will be interacting with today were automatically created by Container Insights when it was configured. They are appear in the console with the following syntax:

- `/aws/ecs/containerinsights/<CLUSTER_NAME>/performance`

The application log groups appear with this syntax:
- `/ecs/<ClusterName>`

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu under `Logs`, click on `Log groups`.
3. In the `Filter log groups` search bar, type in `Services-PayForAdoption`.

![ECS Log groups](/images/containerinsights/ecs7.png?classes=shadow)

4. Click on the log group that is returned in the results by clicking on the name.

> This will take you to a page that shows you the different log streams within the log group.

5. Select the `log stream` that begins with `ClusterTelemetry` by clicking on the log stream name.

> This is the log group that contains performance metrics at the cluster level. To see data collected at the ECS Service level, select the log stream that begins with `FargateTelemetry`. 

6. Type `CloudWatchMetrics` (case sensitive) into the `Filter events` search box.

7. Click on an arrow from the first column in the table to expand a log.

> Along with the performance log data, you will also see that there are metrics present in [Embedded Metric Format](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Embedded_Metric_Format_Specification.html). 

::alert[Visit the [Embedded Metric Format (EMF)](/emf) module if you would like to learn more about EMF.]{type="info"}

 Your screen should look similar to the screen shot below. From here you can view and analyze the metric log data.

![EMF Log event](/images/containerinsights/ecs8.png?classes=shadow)

### Using Logs Insights to query log data

CloudWatch Logs Insights supports a query language that you can use to perform queries on your log groups.

::alert[Visit the [Logs Insights module](/logsinsights) for a deeper dive on this topic.]{type="info"}

8. In the left navigation menu under `Logs`, click on `Insights`.
9. Click the `select log group(s)` search/drop down and type `PayForAdoption`.
10. Select the log group returned in the results by checking the checkbox.
11. Delete the query that is already in the query editor and copy and paste in the following query:

```bash
fields @timestamp, @message
| filter @message like 'In CompleteAdoption'
| sort @timestamp desc
| limit 20
```

12. Click `run query`.

> Running the query above returns log data that contains the string `In CompleteAdoption` in the log message.

Your screen should look similar to the screenshot shown below.

![ECS LogInsightsQuery](/images/containerinsights/ecs9.png?classes=shadow)

This concludes this section. You may continue on to the next section.
