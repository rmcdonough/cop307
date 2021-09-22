---
chapter: true
date: "2020-05-11T09:14:20-04:00"
menuTitle: 5.1 ECS
title: Container Insights on ECS
weight: 10
---

CloudWatch Container Insights collects, aggregates, and summarizes metrics and logs from your containerized applications and microservices. The metrics include utilization for resources such as CPU, memory, disk, and network. The metrics are available in CloudWatch automatic dashboards. For a full list of Amazon ECS Container Insights metrics, see [Amazon ECS Container Insights Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-metrics-ECS.html) in the Amazon CloudWatch User Guide.

Operational data is collected as performance log events. These are entries that use a structured JSON schema that enables high-cardinality data to be ingested and stored at scale. From this data, CloudWatch creates higher-level aggregated metrics at the cluster and service level as CloudWatch metrics. For more information, see [Container Insights Structured Logs for Amazon ECS](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-reference-structured-logs-ECS.html) in the Amazon CloudWatch User Guide.

::alert[Interested in learning more about Amazon ECS? Visit [https://www.ecsworkshop.com/](https://www.ecsworkshop.com/) to get a hands-on experience.]{type="info"}