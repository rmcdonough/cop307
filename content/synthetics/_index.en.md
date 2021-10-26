---
chapter: true
date: "2020-05-10T16:19:45-04:00"
menuTitle: Synthetics
pre: <b>4. </b>
title: CloudWatch Synthetics
weight: 60
---

You can use Amazon CloudWatch Synthetics to create canaries - configurable scripts that run on a schedule - to monitor your endpoints and APIs. Canaries follow the same routes and perform the same actions as a customer, which makes it possible for you to continually verify your customer experience even when you don't have any live traffic on your applications. By using canaries, you can discover issues before your customers do.

Canaries are either Node.js or Python scripts. They create Lambda functions in your account that use these languages as a framework. Canaries can use the Puppeteer Node.js library, or python-selenium, to perform functions on your applications, such as list products on an inventory page or even POST data to an API. Canaries work over both the HTTP and HTTPS protocols.

Canaries check the availability and latency of your endpoints and can store load time data and screenshots of the UI as rendered by a headless Chromium browser. They monitor your REST APIs, URLs, and website content, and they can check for unauthorized changes from phishing, code injection and cross-site scripting. They can even check to see if a percentage of a web page has changed from a baseline that you establish.

Synthetic testing can even take place inside your own VPCs, which enables testing of applications without requiring they be accessible from the Internet.

![Synthetics overview](images/synthetics/synthetics-overview.png)

For a video demonstration of canaries, see the [Amazon CloudWatch Synthetics Demo video](https://www.youtube.com/watch?v=hF3NM9j-u7I).
