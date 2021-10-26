---
date: "2020-05-19T22:57:25-04:00"
menuTitle: 4.1 GUI Workflow canary
title: Setup GUI Workflow canary
weight: 1
---

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. On the left navigation menu under the `Synthetics` section, click `Canaries`.
3. Click the `create canary` button.

![New canary](/images/synthetics/synthetics1.png)

### Create a GUI Workflow canary

We are going to create a new canary that will test the PetSearch API responses. 

4. In a separate tab, navigate to `Cloud9` in the AWS console.
5. Click Open IDE on the observabilityworkshop Cloud9 instance.
6. Open the file called `syn-uicanary.js` located at `one-observability-demo/PetAdoptions/cdk/pet_stack/resources/syn-uicanary.js`.
7. Execute the following command in the terminal and copy the url that it returns: 

```bash
aws ssm get-parameter --name '/petstore/petsiteurl'  | jq -r .Parameter.Value
```

8. Take a look at the code below in the `syn-uicanary.js` file.

``` javascript
// Example: let url = "http://petsite-1081345346.us-east-1.elb.amazonaws.com/";
let url = "<WEBSITE_URL>";
```

9. Replace the string `<WEBSITE_URL>` with the PetSite URL that you copied in step 9 and `save` the file.
10. Right click on the file, and select `Download`.

11. Take a look at the code below which is also part of `syn-uicanary.js`.

``` javascript
await synthetics.executeStep('customerActions', async function () {
    await page.waitForSelector("[id='searchpets']", { timeout: 30000 });
    await page.click("[id='searchpets']");
    try {
        await synthetics.takeScreenshot("click", 'result');
    } catch(ex) {
        synthetics.addExecutionError('Unable to capture screenshot.', ex);
    }

    await page.waitForSelector("[id='seeadoptionlist']", { timeout: 30000 });
    await page.click("[id='seeadoptionlist']");
    try {
        await synthetics.takeScreenshot("click", 'result');
    } catch(ex) {
        synthetics.addExecutionError('Unable to capture screenshot.', ex);
    }

    await page.waitForSelector("[id='performhousekeeping']", { timeout: 30000 });
    await page.click("[id='performhousekeeping']");
    try {
        await synthetics.takeScreenshot("click", 'result');
    } catch(ex) {
        synthetics.addExecutionError('Unable to capture screenshot.', ex);
    }
});
```

As you can see, this code performs three clicks on the three different elements on the page. 

12. Navigate back to the `CloudWatch` tab where you were creating your canary.
13. Select `Inline Editor`.
14. Name your canary `ui-canary`.
15. In the `Script editor` section, select `Upload Script`.
16. Click on `Browse files`, then navigate to and select the `syn-canary.js` file from your downloads folder. 
17. Type in `exports.handler` in the `Script entry point` textbox under `Lambda handler`

> You can also optionally create an alarm based on the metrics created by Synthetics as shown below.

![New canary2](/images/synthetics/synthetics2.png)

> Under `VPC settings`, you can also select the VPC under which you want the canary to be placed on. This is vital if you are testing a non-public facing endpoint. In our case the API endpoint is public facing, so you can leave it as it is. 

18. Click `Create canary`.

This will create the canary and start execution. You should be able to see the canary status on the canary home page as shown below.

![New canary2](/images/synthetics/synthetics5.png)

19. Click on the name of the canary that you just created (it should be `ui-canary`).
> You should see a screen with execution details for the past executions. The failure runs as in red dots for easier identification. You can select any one of them and go to `Logs` tab to see the execution logs.

Since this canary performs UI automation, you will also see the screenshots captured during test runs.

20. Navigate around the `Metrics` and `Configuration` tabs to see more details about the canary run.

![Canary details](/images/synthetics/synthetics6.gif)

This concludes this section. You may continue on to the next section.
