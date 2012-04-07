---
layout: docs
title: Signing requests
description: How to sign requests for extra security.
---

# {{page.title}}

At the cost of a small performance hit, Api Axle supports the signing
of requests. Here's how to use and set them up:

## What makes up a signed request

There are three parts which make up a signing key:

* **Shared secret** - this string is supplied on the provisioning of the
  key and will never be revealed in a HTTP request.
* **Epoch / 3** - the UNIX epoch (seconds since 1970-01-01) divided by
  3. The reason for the division is that will allow for a little
  latency or clock drift between the endpoint and Api Axle.
* **Api key** - the standard key associated with the API.

## Enabling signing for an API key

The signing functionality actually lives with a key, not the API. This
means, when you provision a key via the command-line you do the
following:

    $ ./bin/new-key.coffee --for-api=facebook 1234 --shared-secret=bob-the-builder
    
Now the key `1234` must always carry with it a signed parameter, if it
doesn't then Api Axle will throw an error and close the door on the
request.

## Signing a request as a client

To sign a request you'll need to replicate the following pseudo code
in whatever your language of choice is:

    date = epoch() / 3
    api_key = "1234"
    shared_secret = "bob-the-builder"
    
    # assuming + is your string concatenation operator
    signature = md5( shared_secret + date + api_key )
    
    # now call your end-point with the two query params
    http.GET "facebook.api.localhost?api_sig=$signature&api_key=$api_key"

You can pass the signature in as query parameters named either
`api_sig` or `apiaxle_sig`.
