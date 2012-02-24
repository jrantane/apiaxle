---
layout: docs
title: "Architecture"
---

# {{page.title}}

Apiaxle is effectively a HTTP proxy meaning it's really easy to slide
it into your existing architecture. Below is a simple diagram which
demonstrates the following:

* An Nginx server round-robin distributing requests from the internet
* Four instances of apiaxle - we recommend running as many instances
  of the Apiaxle proxy as you have cores available.
* One Redis store which is used by both Apiaxle products.
* Once instance of the Apiaxle API - how many instances you have
  depends on how busy the API will be. 

![Apiaxle architecture diagram](http://github.com/philjackson/apiaxle/raw/master/proxy/docs/sample-architecture.png)
