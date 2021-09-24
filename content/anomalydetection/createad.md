---
date: "2020-05-28T23:15:11-04:00"
menuTitle: 7.1 Setup Anomaly Detection
title: Setup Anomaly Detection
weight: 1
---

When you enable anomaly detection for a metric, CloudWatch applies statistical and machine learning algorithms. These algorithms continuously analyze metrics of systems and applications, determine normal baselines, and surface anomalies with minimal user intervention.

The algorithms generate an anomaly detection model. The model generates a range of expected values that represent normal metric behavior.

### Setup Anomaly Detection on a CloudWatch Metric

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu, click on `Metrics`.
3. Click on `Container Insights`, then the `ClusterName, Namespace, PodName` dimension.
> This will take you to the metrics of the EKS deployment of PetSite. 

4. Type `petsite-deployment` into the search bar. 
5. Check the checkbox for the metric with the Metric Name `pod_cpu_utilization`.

Your screen should look similar to the one below:


![Cloudwatch metric visualization](/images/anomalydetection/detection1.png?classes=shadow)

6. Click on the `Graphed metrics` tab.
7. Click on the `Anomaly Detection` icon as shown in the picture below.

![Option to enable anomaly detection](/images/anomalydetection/detection2.png)

Anomaly Detection (AD) will be enabled immediately. A model is created based on the metric data points for a 2 week period. AD can also be enabled even if there is no data available for 2 week period.

![Anomaly detection enabled on a metric](/images/anomalydetection/detection3.gif?classes=shadow)

### Modifying the Anomaly Detection expression

Notice the expression below in the `Details` tab:

```bash
ANOMALY_DETECTION_BAND(m1, 2)
```

This indicates that AD has been enabled for the metric with Id `m1` with a standard deviation of 2 as default. You can also adjust the standard deviation to give more wiggle room for the metric datapoint if desired. Simply edit the expression as shown below.

![Modifying Anomlay Detection band](/images/anomalydetection/detection4.gif?classes=shadow)

### Editing and deleting an existing model

You can edit a model by  clicking on `Edit model` link located in the `Actions` row. This will take you to the edit screen, where you can edit the model to exclude a specific time period from the model calculation. 
For example, if you have a deployment coming up and you expect the metrics during that time to affect the AD model, just add that duration to the excluded period, which will make AD ignore metrics during that timeframe.

![Edit existing anomaly detection model](/images/anomalydetection/detection5.png?classes=shadow)

To delete a model, simply click on `Delete model`.

### Creating a model programmatically

You can use the `put-anomaly-detector` CLI command to create an Anomaly Detection model on a metric programmatically. 

8. In the AWS Management Console on the Services menu, click `CloudShell`.
9. Execute the following command in the terminal:
> If you deployed petsite on EKS, the following command creates an AD model on the metric `pod_cpu_utilization` in the `ContainerInsights` namespace under `ClusterName` dimension. If your clustername is different, replace `petsite` to the appropriate name.

```bash
 aws cloudwatch put-anomaly-detector --namespace ContainerInsights --metric-name pod_cpu_utilization --stat Average --dimensions Name=ClusterName,Value=petsite
```

If you deployed petsite on ECS, the following command creates an AD model on the metric `CpuUtilized` in the `ECS/ContainerInsights` namespace under `ClusterName` dimension. Make sure to enter one of the ECS clusters name in the `Value` parameter.

```bash
 aws cloudwatch put-anomaly-detector --namespace ECS/ContainerInsights --metric-name CpuUtilized --stat Average --dimensions Name=ClusterName,Value=<REPLACE_THE_ECS_CLUSTER_NAME_HERE>
```

::alert[Learn about the syntax of this CLI command [here](https://docs.aws.amazon.com/cli/latest/reference/cloudwatch/put-anomaly-detector.html).]{type="info"}

### List all AD models in your account

10. Execute the following command in the terminal: 
> This command lists all AD models in your account. It will show details about the ADs in your account along with their training information
```bash
aws cloudwatch describe-anomaly-detectors
```

You should see a result similar to the one below.

```json
{
    "AnomalyDetectors": [
       {
            "Namespace": "ContainerInsights",
            "MetricName": "pod_cpu_utilization",
            "Dimensions": [
                {
                    "Name": "ClusterName",
                    "Value": "petsite"
                }
            ],
            "Stat": "Average",
            "Configuration": {
                "ExcludedTimeRanges": []
            },
            "StateValue": "TRAINED_INSUFFICIENT_DATA"
        }
    ]
}

```

This concludes the Anomoly Detection module.
