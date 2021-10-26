---
date: "2020-05-19T22:57:25-04:00"
menuTitle: 4.3 Canary recorder
title: Setup canary recorder
weight: 4
---

### Install the Synthetics canary recorder

{{% notice info %}}
You can use your web browser to record interactions with web pages and replay them in a canary, but at this time the required extension is only supported by Chrome. You will need to follow the first two portions here using Chrome.
{{% /notice %}}

1. The Synthetics canary recorder is available as an extension for Chrome. You can find it by opening the Extensions panel, expand the **Extensions** menu on the left, and then clicking on the `Open Chrome Web Store` link.

![Chrome extensions view](/images/synthetics/recorder1.png)

2. In the Chrome web store, search for `synthetics canary recorder` and install the CloudWatch Synthetics Recorder.

![Chrome extensions installation](/images/synthetics/recorder2.png)

### Create a new canary recording

While you can record interactions with any website using the Synthetics canary recorder, we will continue to work with the pet adoption site. You can fetch the URL using these steps:

3. In a separate tab, navigate to `Cloud9` in the AWS console.
4. Click Open IDE on the `observabilityworkshop` Cloud9 instance.
5. Execute the following command in the terminal and copy the url that it returns: 

```bash
aws ssm get-parameter --name '/petstore/petsiteurl'  | jq -r .Parameter.Value
```
 
6. Open a new tab in your browser, and paste the petsite's URL into your browser. 
7. Click the new CloudWatch Synthetics Recorder icon in your extensions, then click on **Start recording**, and perform some actions: search for pets, adopt one, and so on. Every action that you take is recorded. 

![Start the canary recorder](/images/synthetics/recorder3.png)

8. When you have performed several interactions, click on the CloudWatch Synthetics Recorder again, and then on **Stop recording**. The script of your interactions, along with the dimensions of your browser window, will be included in the script. Click on **Copy to clipboard**, as will use this in the next step.

### Create a new synthetic canary

8. In the AWS Management Console on the Services menu, click `CloudWatch`.
9. On the left navigation menu under the `Synthetics` section, click `Canaries`.
10. Click the `create canary` button.

![New canary](/images/synthetics/synthetics1.png)
 
11. Click on the **Canary Recorder** option.
12. Enter `canary-recorder` as the name of the new canary.
13. In the script editor, select `syn-node-js-puppeteer-3.2` as the runtime.
14. Paste the script body from the previous section into the script editor window.

{{% notice tip %}}
You can also optionally create an alarm based on the metrics created by Synthetics as shown below.
{{% /notice %}}

![New canary 2](/images/synthetics/synthetics2.png)

{{% notice tip %}}
Under `VPC settings`, you can also select the VPC under which you want the canary to be placed on. This is vital if you are testing a non-public facing endpoint. In our case the API endpoint is public facing, so you can leave it as it is. 
{{% /notice %}}

15. Click `Create canary`.

{{% notice info %}}
Note that it may take a minute for the canary creation to complete. Please do not leave the page until it does.
{{% /notice %}}

This will create the canary and start execution. You should be able to see the canary status on the canary home page as shown below.

![New canary 3](/images/synthetics/synthetics5.png)

16. Click on the name of the canary that you just created (it should be `canary-recorder`).

You should see a screen with execution details for the past executions. The failure runs as in red dots for easier identification. You can select any one of them and go to `Logs` tab to see the execution logs.

Since this canary performs UI automation, you will also see the screenshots captured during test runs.

17. Navigate around the `Metrics` and `Configuration` tabs to see more details about the canary run.

![Canary details](/images/synthetics/synthetics6.gif)

This concludes this section. You may continue on to the next section.
