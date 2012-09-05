---
layout: apidocs
title: "Api documentation"
---

# /v1/api/:api
## POST

Add a new API definition for `:api`.

### Fields supported:

* globalCache - The time in seconds that every call under this API should be cached.
* endPoint - The endpoint for the API. For example; `graph.facebook.com`
* apiFormat - (default: json) The resulting data type of the endpoint. This is redundant at the moment but will eventually support both XML too.
* endPointTimeout - (default: 2) Seconds to wait before timing out the connection
* endPointMaxRedirects - (default: 2) Max redirects that are allowed when endpoint called.

### Returns:

* The inserted structure (including the new timestamp fields).

## GET

Get the definition for API `:api`.

### Returns:

* The API structure (including the timestamp fields).

## DELETE

Delete the API `:api`.

### Returns:

* `true` on success.

## PUT

Update the API `:api`. Will merge fields you pass in.

### Fields supported:

* globalCache - The time in seconds that every call under this API should be cached.
* endPoint - The endpoint for the API. For example; `graph.facebook.com`
* apiFormat - (default: json) The resulting data type of the endpoint. This is redundant at the moment but will eventually support both XML too.
* endPointTimeout - (default: 2) Seconds to wait before timing out the connection
* endPointMaxRedirects - (default: 2) Max redirects that are allowed when endpoint called.

### Returns:

* The merged structure (including the timestamp fields).

# /v1/key/:key
## POST

Add a new key.

### Fields supported:

* sharedSecret - A shared secret which is used when signing a call to the api.
* qpd - (default: 172800) Number of queries that can be called per day. Set to `-1` for no limit.
* qps - (default: 2) Number of queries that can be called per second. Set to `-1` for no limit.
* forApi - Name of the Api that this key belongs to.

### Returns:

* The newly inseted structure (including the new timestamp
  fields).

## GET

Get the details of key `:key`.

### Returns:

* The key object (including timestamps).

## DELETE

Delete the key `:key`.

### Returns:

* `true` on success.

## PUT

Update an existing key `:key`. Fields passed in will will be
merged with the old key details.

### Fields supported:

* sharedSecret - A shared secret which is used when signing a call to the api.
* qpd - (default: 172800) Number of queries that can be called per day. Set to `-1` for no limit.
* qps - (default: 2) Number of queries that can be called per second. Set to `-1` for no limit.
* forApi - Name of the Api that this key belongs to.

### Returns:

* The newly inseted structure (including the new timestamp
  fields).

# /v1/key/list/:from/:to
## GET

List the keys in the database.

### Path parameters

* from: Integer for the index of the first key you want to
  see. Starts at zero.
* to: Integer for the index of the last key you want to
  see. Starts at zero.

### Supported query params:

* resolve: if set to `true` then the details concerning the listed
  keys will also be printed. Be aware that this will come with a
  minor performace hit.

### Returns:

* Without `resolve` the result will be an array with one key per
  entry.
* If `resolve` is passed then results will be an object with the
  key name as the key and the details as the value.

# /v1/stats/:key/all
## GET

Get the statistics for key `:key`.

### Returns:

* Object where the keys represent the HTTP status code of the
  endpoint or the error returned by apiaxle (QpsExceededError, for
  example). Each object contains date to hit count pairs.

