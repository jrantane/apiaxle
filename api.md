---
layout: apidocs
title: "Api documentation"
---

# /v1/api/:api
## POST

Add a new API definition for `:api`.

Returns:

* The inseted structure (including the new timestamp fields).

## GET

Get the definition for API `:api`.

Returns:

* The API structure (including the timestamp fields).

## DELETE

Delete the API `:api`.

Returns:

* `true` on success.

## PUT

Update the API `:api`. Will merge fields you pass in.

Returns:

* The merged structure (including the timestamp fields).

# /v1/key/:key
## POST

Add a new key.

Returns:

* The newly inseted structure (including the new timestamp
  fields).

## GET



## DELETE



## PUT



# /v1/key/list/:from/:to
## GET

List the keys in the database.

Supported query params:

* resolve: if set to `true` then the details concerning the listed
  keys will also be printed. Be aware that this will come with a
  minor performace hit.

Returns:

* Without `resolve` the result will be an array with one key per
  entry.
* If `resolve` is passed then results will be an object with the
  key name as the key and the details as the value.

