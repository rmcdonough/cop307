---
date: "2020-05-26T22:42:24-04:00"
menuTitle: Using the Console
title: Using Container Insights Console
weight: 2
---

#### Viewing cluster resources
1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu under `Container Insights`, click on `Resources`.
3. Click in the `Filter by cluster` search box, then select the option starting with `Services-PayForAdoptions` from the drop down list.

> This will return all the resources that associated with the selected cluster.


You can also search for a specific resource by using the `Find resources` search box. For example, you can execute a search for resources containing the keyword `task` as shown below.
![ECS Resources page](/images/containerinsights/ecs12.png?classes=shadow)

#### Map view
4. Click on `Map View` in the top right corner.

> This will show the cluster resources in a tree format.

5. Select the  `Services-PayForAdoption` node on the map.

> This will cause critical metrics about the resource to appear at the bottom of the screen. In this example, you can see cpu, memory, and network related metrics aggregated at the cluster level.


![ECS Map view](/images/containerinsights/ecs3.png?classes=shadow)

6. Click the `View Dashboard` button located in the top right of the panel displaying the metrics.

Here you will be able to see the automatic dashboards created by CloudWatch Container Insights. For ECS, you can see performance and health metrics at the following levels:

- ECS Cluster
- ECS Nodes
- ECS Service
- ECS Tasks

7. Click on the dashboard drop down (the one with `ECS Clusters` selected) and click on a few of the options listed above to view the different dashboards.

As demonstrated in the GIF below, you can also see the application and performance logs for a selected resource.

![ECS Dashboard](/images/containerinsights/ecs4.gif?classes=shadow)

8. Select `ECS Services` from the dashboard drop down.
9. Select `Services-PayForAdoption` from the `Filters` drop down. (The drop down directly to the right of the dashboard drop down).
10. Scroll down to the `Task Performance` section and select one of the tasks by checking the checkbox. 
11. Click on the `Actions` drop down at the top right of the section, then click `View performance logs`.

![ECS Logs](/images/containerinsights/ecs5.png?classes=shadow)

You will be redirected to the `CloudWatch Logs Insights` screen as shown below. Notice that the log group and time line were already selected, and a sample query is already present.

12. Click `run query` and view the logs listed.

![ECS Logs Insights](/images/containerinsights/ecs6.png?classes=shadow)

This concludes this section. You may continue on to the next section.
