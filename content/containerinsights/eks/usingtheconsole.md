---
date: "2020-05-24T19:29:07-04:00"
menuTitle: Using the Console
title: Using the Console
weight: 2
---

#### Viewing cluster resources
1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. In the left navigation menu under `Container Insights`, click on `Resources`.
3. Click in the `Filter by cluster` search box, then select `PetSite` from the drop down list.

> This will return all the resources that are associated with the selected cluster.

You can also search for a specific resource by using the `Find resources` search box. For example, you can execute a search for resources containing the keyword `pod` as shown below.

![EKS Resources page](/images/containerinsights/eks1.png?classes=shadow)

#### Map view
4. Click on `Map View` in the top right corner.

> This will show the cluster resources in a tree format.

5. Select the  `PetSite` node on the map.

> This will cause critical metrics about the resource to appear at the bottom of the screen. In this example, you can see cpu, memory, and network related metrics aggregated at the cluster level.


![EKS Map view](/images/containerinsights/eks2.png?classes=shadow)

6. Click the `View Dashboard` button located in the top left of the panel displaying the metrics.

Here you will be able to see the automatic dashboards created by CloudWatch Container Insights. For EKS, you can see performance and health metrics at the following levels:

- EKS Namespace
- EKS Cluster
- EKS Nodes
- EKS Service
- EKS Pods

7. Click on the dashboard drop down (the one with `EKS Clusters` selected) and click on a few of the options listed above to view the different dashboards.

As demonstrated in the GIF below, you can also see the application and performance logs for a selected resource.

![EKS Dashboard](/images/containerinsights/eks3.gif?classes=shadow)

8. Select `EKS Services` from the dashboard drop down.
9. Select `PetSite` from the `Filters` drop down. (The drop down directly to the right of the dashboard drop down).
10. Scroll down to the `Pod Performance` section and select one of the tasks by checking the checkbox. 
11. Click on the `Actions` drop down at the top right of the section, then click `View performance logs`.

![EKS Logs](/images/containerinsights/eks4.png?classes=shadow)

You will be redirected to the `CloudWatch Logs Insights` screen as shown below. Notice that the log group and time line were already selected, and a sample query is already present.

12. Click `run query` and view the logs listed.

![EKS Logs Insights](/images/containerinsights/eks5.png?classes=shadow)

This concludes this section. You may continue on to the next section.
