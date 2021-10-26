---
date: "2020-06-03T17:09:15-04:00"
menuTitle: 6.1 Querying Logs
title: Querying Logs
weight: 1
---

### Using Logs Insights queries

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu under `Logs`, click on `Insights`.
3. From the `Select log group(s)` drop-down, select the `ecs/PetListAdoptions` log group.

> Note: you can select more than one log group. As of May 2020, you can select up to 20 log groups at a time.

![Select Log Groups](/images/logsinsights/li1.png?classes=shadow)

You will see that a sample query is automatically placed in the query field. 

4. Click on `Run query` and view the results.

> The sample query fetches the `@timestamp` and `@message` fields from the log data, orders by the timestamp field in descending order and, displays the first 20 records.

![Log Results2](/images/logsinsights/li2.png?classes=shadow)

{{% notice tip %}}
You can learn more about Logs Insights syntax and queries [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
{{% /notice %}}

#### Simple list with filter and sort

5. Copy the following query and paste it into the query editor.

> The following query applies a filter on the messages and fetches only the records that contain the string `brown` in the log. 

```
fields @timestamp, @message
| sort @timestamp desc
| limit 20
| filter @message like /brown/
```

6. Click on `run query`.

> The are results ordered by the timestamp field and displayed in descending order.

![Log Results5](/images/logsinsights/li5.png?classes=shadow)  

#### List with aggregation, sort and timeseries

7. Delete the query that is already in the query editor and copy and paste in the following query:

> The following query returns a result that contains the number of messages captured by in minute intervals

```
fields @timestamp, @message
| stats count(@message) as number_of_events by bin(5m)
| limit 20
```

You can also visualize the results by clicking on the `Visualization` tab in the results area as shown below.

> Notice that you can also add the visualization to a CloudWatch Dashboard, export to csv and so on.

![Log Results7](/images/logsinsights/li7.png?classes=shadow) 

### Querying using AWS CLI

You can also query log groups using the AWS CLI.

{{% notice info %}}
Ensure that the [Setup Cloud9](/installation/using_ee/setup_cloud9.html) steps are completed before proceeding.
{{% /notice %}}

9. Execute the following query in the terminal:
 
 > The query below queries the top 10 log records from a log group for a specific time period.

{{% notice info %}}
You may need to update the start and end time parameter values to the right epoch time values. You can calculate epoch time values from this public website - https://www.epochconverter.com/
{{% /notice %}}

```bash
aws logs start-query \
--log-group-name /ecs/PetListAdoptions \
--start-time $(date -d "12 hour ago" "+%s") \
--end-time $(date "+%s") \
--query-string 'fields @message | limit 10'
```
The above query will return a `queryId`.

10. Copy and paste the query id that was return as a result of the query above.
11. Replace `<QUERY_ID>` with the query ID that you copied from the result and execute the command below in the terminal:

```bash
aws logs get-query-results --query-id <QUERY_ID>
```

> If no logs were returned, use the website in the orange info alert above to update the epoch time values and try again. 

This concludes this section. You may continue on to the next section.
