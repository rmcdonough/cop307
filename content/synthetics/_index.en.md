---
chapter: true
date: "2020-05-10T16:19:45-04:00"
menuTitle: Synthetics
pre: <b>4. </b>
title: CloudWatch Synthetics
weight: 60
---

You can use Amazon CloudWatch Synthetics to create canaries, configurable scripts that run on a schedule, to monitor your endpoints and APIs. Canaries follow the same routes and perform the same actions as a customer, which makes it possible for you to continually verify your customer experience even when you don't have any customer traffic on your applications. By using canaries, you can discover issues before your customers do.

Canaries are Node.js scripts. They create Lambda functions in your account that use Node.js as a framework. Canaries can use the Puppeteer Node.js library to perform functions on your applications. Canaries work over HTTP and HTTPS protocols.

Canaries check the availability and latency of your endpoints and can store load time data and screenshots of the UI. They monitor your REST APIs, URLs, and website content, and they can check for unauthorized changes from phishing, code injection and cross-site scripting.

For a video demonstration of canaries, see the [Amazon CloudWatch Synthetics Demo video](https://www.youtube.com/watch?v=hF3NM9j-u7I).

:button[Learn more about this topic...]{href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries.html"}