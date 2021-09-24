---
date: "2021-01-31T13:36:36-05:00"
title: Introduction to AWS Observability
weight: 5
---

AWS provides native monitoring, logging, alarming, and dashboards with [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) and tracing through [AWS X-Ray](https://aws.amazon.com/xray/). When deployed together, they provide the 3 pillars (Metric, Logs & Traces) of an observability solution. 

During re\:Invent 2020, AWS launched [Amazon Managed Service for Prometheus (AMP)](https://aws.amazon.com/prometheus/) and [Amazon Managed Service for Grafana (AMG)](https://aws.amazon.com/grafana/), two new open-source based managed services, providing additional options for customers to choose from.

AWS also launched [AWS Distro for OpenTelemetry (ADOT)](https://aws-otel.github.io/)- a secure, production-ready, AWS-supported distribution of the OpenTelemetry project. Part of the Cloud Native Computing Foundation, OpenTelemetry provides open source APIs, libraries, and agents to collect distributed traces and metrics for application monitoring. With AWS Distro for OpenTelemetry, you can instrument your applications just once to send correlated metrics and traces to multiple AWS and Partner monitoring solutions.

:button[Watch]{href="https://youtu.be/jt-gV1YwmnI?t=6083"} Amazon CTO Werner Vogels' re\:Invent keynote where he launches Amazon Managed Service for Prometheus, Amazon Managed Service for Grafana, and AWS Distro for OpenTelemetry.

_This clip has been cued to play an **14m30s** excerpt from the middle of the video (1:41:23-1:55:53)_

### AWS Observability options

![Cloud9 Instance](/images/intro/aws-observability.png?classes=shadow)
