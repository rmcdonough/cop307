---
date: "2020-05-26T11:49:40-04:00"
menuTitle: 3.2 Working with Traces
title: Working with Traces
weight: 2
---

1. Click the `View traces` button at the top right of the screen. 
> This will take you to the Traces screen. You can also directly go to the Traces screen by clicking [this link](https://console.aws.amazon.com/cloudwatch/home?#servicelens\:traces), or by clicking `Traces` from the `ServiceLens` section on the left navigation menu. (Note: once on the Traces page, select any Lambda function from the drop down menu before continuing)

2. Take a look at the screenshot below. There are various options to filter traces by to identify and narrow down an issue you are investigating.

3. Under `Filter type`, select `PetType`. 
> You will see that the filter values show the different PetType values captured during the selected time. 

4. Select any of the rows in the list and click `Add to filter`. This will filter and show on the traces based on the filter applied.

::alert[Note: The red arrows with text are call outs for various possible actions you can take on the screen.]{type="info"}


![Traces home screen showing various filter options on trace annotation](/static/images/servicelens/sl-traces1.png?classes=shadow)

5. Scroll down and type `MakePayment` into the filter traces textbox. 
> This will filter and only show the traces with URLs containing the text `MakePayment`. 

6. Select any of the traces from the table by clicking on the trace ID.

![Filtering trace data](/static/images/servicelens/sl-traces2.png?classes=shadow)

This concludes this section. You may continue on to the next section.