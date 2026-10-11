---
title: Installation Notes
---

## First login

On first start, SolidPing creates an administrator account `admin@solidping.io` with the
password `solidpass`. That password is public, so it only works once: the first login
lands on a "set a new password" screen, and nothing else is reachable until it is changed.

Log in right after the install and set your own password. To use another administrator
email, set `SP_ADMIN_EMAIL` before the first start. It is only read on an empty database.

## Single replica

The chart stores everything on SQLite in the `/data` volume (database and uploaded files).
SQLite takes a single writer, so keep one replica. For more replicas, use PostgreSQL by
setting `SP_DB_TYPE=postgres` and `SP_DB_URL`.

## JWT secret

Nothing to set. When `SP_AUTH_JWT_SECRET` is empty, SolidPing generates a random secret on
first start and stores it in the database, so sessions survive a restart.

## Public URL

Set `SP_BASE_URL` to the address users reach SolidPing on (for example
`https://solidping.example.com`) when it sits behind an ingress. It is used in links sent
by email and notifications.
