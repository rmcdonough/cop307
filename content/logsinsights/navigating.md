---
date: "2020-06-04T15:07:47-04:00"
menuTitle: 6.2 Navigating the Interface
title: Navigating the Interface
weight: 2
---

#### Automatic field discovery
CloudWatch can automatically discover fields from your log data.

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu under `Logs`, click on `Insights`.
3. Select the log group called `/aws/containerinsights/petsite/performance` from the `Select log group(s) drop down. 

> Note: You can select more than one log group to query on. 

4. Click `run query`.
5. In the right navigation menu, click `Fields`.

You will see a list of fields that were discovered by CloudWatch automatically as shown below.

![Logs Insights log group details](/images/logsinsights/li8.png?classes=shadow)

This allows you to pick and include the fields that you want to query on in the query area using intellisense.

![Logs Insights logs insights intellisense](/images/logsinsights/li11.png?classes=shadow)

#### Sample queries
Logs Insights also provides sample queries for you to easily get started with.

6. In the right navigation menu, click `Queries`.

> You will see a list of sample queries sorted into categories such as service or frequency of use. Select a query and click 'Apply' on the query you are interested in to use it.

![Logs Insights sample queries](/images/logsinsights/li12.png?classes=shadow)

#### Saved queries and query history
You can save your queries into Logs Insights to access them later. Simply click the `Save` button on the interface and provide a name to it to Save the query. You can also optionally provide a custom name for the folder.

7. Click the `Save` button underneath the query editor.
8. Enter `Sample1` for query name.
9. Select `Save`.


![Logs Insights saved queries](/images/logsinsights/li10.png?classes=shadow)

10. In the right navigation menu, click `Queries`.

You should now have a query called `Sample1` listed under `Saved queries`.

![Logs Insights save query successfully](/images/logsinsights/li9.png?classes=shadow)

11. Click the `History` button underneath the query editor. 

Here you can see a history of all the queries you have executed. You will be able to see queries executed by the logged in user whether they are saved queries or not.

![Logs Insights query history](/images/logsinsights/li13.gif?classes=shadow)

This concludes the Logs Insights module.
