---
date: "2020-05-26T11:51:32-04:00"
menuTitle: 3.3 Correlating Logs, Metrics & Traces
title: Correlating Logs, Metrics & Traces
weight: 3.3
---

At this point in the module, you should be on the `Trace Details` page for a specific trace as shown below. If you are not at this point, please revisit section 3.2.

1. Take a look at the `Trace Map`. 
> This shows a map of the services across which the trace traversed through. 

![Trace Map showing trace details](/static/images/servicelens/sl-traces3.png?classes=shadow)

2. Scroll down to the section titled `Logs`. You will find all the log data from the different services captured at the moment this trace was recorded. In this example, you will be able to see log data captured by an ECS Service along with log data recorded by the Lambda function, all at the same time.

> This gives great insights into the scenario you are investigating. 

With ServiceLens, as you just saw, not only are you able to view the service interaction data through X-Ray traces and get insights into service metric information automatically through dashboards, but you also get insights into the context of various microservices through application logs captured the moment the trace was recorded.

![LogCorrelation with trace](/static/images/servicelens/sl-traces4.png?classes=shadow)

3. Click the `View in CloudWatch Logs Insights` button to navigate to the CloudWatch Logs Insights page.
> This selects all the log groups that are involved in the mix and writes the query that will fetch the log data. 
4. Click on `Run query` to execute the query and analyze log data there.

This concludes the ServiceLens module.