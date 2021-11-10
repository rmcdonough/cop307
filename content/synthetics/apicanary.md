---
date: "2020-05-19T22:57:25-04:00"
menuTitle: 4.2 API canary
title: Setup API canary
weight: 2
---

1. In the AWS Management Console on the Services menu, click `CloudWatch`.
2. On the left navigation menu under the `Synthetics` section, click `Canaries`.
3. Click the `create canary` button.

![New canary](/images/synthetics/synthetics1.png)

### Create an API Workflow canary

We are going to create a new canary that will test the PetSearch API responses. 

4. In a separate tab, navigate to `Cloud9` in the AWS console.
5. Click Open IDE on the observabilityworkshop Cloud9 instance.
6. Open the file called `syn-apicanary.js` located at `one-observability-demo/PetAdoptions/cdk/pet_stack/resources/syn-apicanary.js`.
7. Execute the following command in the terminal and copy the url that it returns: 

```bash
aws ssm get-parameter --name '/petstore/searchapiurl'  | jq -r .Parameter.Value
```

8. Take a look at the code below in the `syn-apicanary.js` file.

``` javascript
const pettypes = ["fish", "bunny", "puppy", "kitten"];
const position = Math.floor(Math.random() ` Math.floor(4));

const requestOptions = {
    hostname: '<ALB_HOST_NAME>',
    // Example: hostname: 'petsearch-live.us-east-1.elasticbeanstalk.com',
    port: 80,
    path: '/api/search?pettype='+pettypes[position],
    method: 'GET'
}
```

The PetAdoptions application does not support the PetType `fish`, however this code above randomly picks array entries from the pettypes array. There are good chances for it to pick `fish` once in a while. 

9. Replace the string `<ALB_HOST_NAME>` with the hostname from the PetSearch API URL that you copied in step 9 and `save` the file.
10. Right click on the file, and select `Download`.

11. Take a look at the code below which is also part of `syn-apicanary.js`.

``` javascript
req.on('response', (res) => {
  log.info(`Status Code: ${res.statusCode}`)
  log.info(`Response Headers: ${JSON.stringify(res.headers)}`)
  if (res.statusCode !== 200) {
     reject("Failed: " + requestOption.path);
  }
  res.on('data', (d) => {
    log.info("Response: " + d.length);
    if(d.length <= 2)
    {
        reject("PetType Invalid - : "+requestOption.path );
    }
  });
  res.on('end', () => {
    resolve();
  })
});
```

In this code, you see that the response length is checked, and if the response length is short (<=2) we call the `reject()` function which indicates canary executing failure.

12. Navigate back to the `CloudWatch` tab where you were creating your canary.
13. Select `Inline Editor`.
14. Name your canary `petsearch-api`.
15. In the `Script editor` section, select `Upload Script`.
16. Click on `Browse files`, then navigate to and select the `syn-canary.js` file from your downloads folder. 
17. Type in `exports.handler` in the `Script entry point` textbox under `Lambda handler`

> You can also optionally create an alarm based on the metrics created by Synthetics as shown below.

![New canary2](/images/synthetics/synthetics2.png)

> Under `VPC settings`, you can also select the VPC under which you want the canary to be placed on. This is vital if you are testing a non-public facing endpoint. In our case the API endpoint is public facing, so you can leave it as it is. 

18. Click `Create canary`.

This will create the canary and start execution. You should be able to see the canary status on the canary home page as shown below.

![New canary2](/images/synthetics/synthetics5.png)

19. Click on the name of the canary that you just created (it should be `petsearch-api`).
> You should see a screen with execution details for the past executions. The failure runs as in red dots for easier identification. You can select any one of them and go to `Logs` tab to see the execution logs.

Since this is an API testing canary which does not have UI, there were no screenshots captured.

20. Navigate around the `Monitoring` and `Configuration` tabs to see more details about the canary run.

![New canary2](/images/synthetics/synthetics4.gif)

This concludes the Synthetics module.
