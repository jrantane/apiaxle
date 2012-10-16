---
layout: apidocs
title: "Api documentation"
---

# /v1/api/:api
## Add a new API definition for `:api`. (POST)
### Fields supported

* globalCache - The time in seconds that every call under this API should be cached.
* endPoint - The endpoint for the API. For example; `graph.facebook.com`
* apiFormat - (default: json) The resulting data type of the endpoint. This is redundant at the moment but will eventually support both XML too.
* endPointTimeout - (default: 2) Seconds to wait before timing out the connection
* endPointMaxRedirects - (default: 2) Max redirects that are allowed when endpoint called.

### Returns

* The inserted structure (including the new timestamp fields).

## Delete the API `:api`. (DELETE)
### Returns

* `true` on success.

## Update the API `:api`. (PUT)
Will merge fields you pass in.

### Fields supported

* globalCache - The time in seconds that every call under this API should be cached.
* endPoint - The endpoint for the API. For example; `graph.facebook.com`
* apiFormat - (default: json) The resulting data type of the endpoint. This is redundant at the moment but will eventually support both XML too.
* endPointTimeout - (default: 2) Seconds to wait before timing out the connection
* endPointMaxRedirects - (default: 2) Max redirects that are allowed when endpoint called.

### Returns

* The merged structure (including the timestamp fields).

## Get the definition for API `:api`. (GET)
### Returns

* The API structure (including the timestamp fields).

# /v1/api/:api/keys/:from/:to
## List keys belonging to :api (GET)
### Path parameters

* from: Integer for the index of the first key you want to
  see. Starts at zero.
* to: Integer for the index of the last key you want to
  see. Starts at zero.

### Supported query params

* resolve: if set to `true` then the details concerning the listed
  keys will also be printed. Be aware that this will come with a
  minor performace hit.

### Returns

* Without `resolve` the result will be an array with one key per
  entry.
* If `resolve` is passed then results will be an object with the
  key name as the key and the details as the value.

# /v1/key/:key
## Add a new key. (POST)
### Fields supported

* sharedSecret - A shared secret which is used when signing a call to the api.
* qpd - (default: 172800) Number of queries that can be called per day. Set to `-1` for no limit.
* qps - (default: 2) Number of queries that can be called per second. Set to `-1` for no limit.
* forApi - Name of the Api that this key belongs to.

### Returns

* The newly inseted structure (including the new timestamp
  fields).

## Get the details of key `:key`. (GET)
### Returns

* The key object (including timestamps).

## Delete the key `:key`. (DELETE)
### Returns

* `true` on success.

## Update an existing key `:key`. (PUT)
Fields passed in will will be merged with the old key details.

### Fields supported

* sharedSecret - A shared secret which is used when signing a call to the api.
* qpd - (default: 172800) Number of queries that can be called per day. Set to `-1` for no limit.
* qps - (default: 2) Number of queries that can be called per second. Set to `-1` for no limit.
* forApi - Name of the Api that this key belongs to.

### Returns

* The newly inseted structure (including the new timestamp
  fields).

# /v1/key/:key/stats
## Get the statistics for key `:key`. (GET)
### Returns

* Object where the keys represent the HTTP status code of the
  endpoint or the error returned by apiaxle (QpsExceededError, for
  example). Each object contains date to hit count pairs.

# /v1/key/list/:from/:to
## List the keys in the database. (GET)
### Path parameters

* from: Integer for the index of the first key you want to
  see. Starts at zero.
* to: Integer for the index of the last key you want to
  see. Starts at zero.

### Supported query params

* resolve: if set to `true` then the details concerning the listed
  keys will also be printed. Be aware that this will come with a
  minor performace hit.

### Returns

* Without `resolve` the result will be an array with one key per
  entry.
* If `resolve` is passed then results will be an object with the
  key name as the key and the details as the value.

