---
title: Migrate DB from pgvecto.rs to VectorChord
---

:::caution

- This guide is not covered by support. However you can make a thread on Discord if you have any questions.
- Following this guide is at your own risk and any data loss is not the responsibility of TrueCharts and or their team.
- Make backups of your existing database before continue.

:::

Since chart version 25 the PostgreSQL extension is changed from pgvecto.rs to VectorChord. Therefore before upgrading to chart version 25, you need to migrate your database.

## Prerequisite

In this guide we are using the shell of the CNPG pods. How to exec in a pod, is something we assume you're familiar with.  
Also you need to be familiar with running 'kubectl' commands.
We assume Immich is in the namespace `Immich`, when different adapt accordingly.

## Change database user rights

Typically Immich expects superuser permission in the database. This is needed for this upgrade, but also practical for future. With this permission automated database dumps can also be used inside Immich itself. Also with a new version of VectorChord reindex the database will be automaticly.

- Exec into pod `immich-cnpg-main-1`
- run: `psql immich`
- run: `ALTER USER immich WITH SUPERUSER;`

When all went OK it looks like this:

```bash
postgres@immich-cnpg-main-1:/$ psql immich
psql (16.3 (Debian 16.3-1.pgdg110+1))
Type "help" for help.

immich=# ALTER USER immich WITH SUPERUSER;
ALTER ROLE
immich=# 
```


## Only running CNPG pods are allowed

:::danger

From this moment on, it is not allowed to have any Immich pods spin up during the entire migration process. If this happen for whatever reason, your Database is broken and can only be restored from a backup. And you need to start over with this tutorial.

Only the CNPG pods needs to be available.

When driftDetection is set to "enabled", make sure this is removed.

:::

:::caution

Reminder: Make sure backups are available.

:::

1. Scale all deployments down to "0"

- Add to your .Values

```yaml
    workload:
      main:
        replicas: 0
```
- Check if immich deployment is 0/0 with `kubectl get deployments -n immich`
- run: `kubectl scale --replicas=0 deployment/immich-machinelearning -n immich`
- run: `kubectl scale --replicas=0 deployment/immich-microservices -n immich`

2. Check if all deployments are now scaled down and only cnpg and redis pods are their.

- run: `kubectl get deployments,pods -n immich`

```bash
kubectl get deployments,pods -n immich
NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/immich                   0/0     0            0           34m
deployment.apps/immich-machinelearning   0/0     0            0           34m
deployment.apps/immich-microservices     0/0     0            0           34m

NAME                     READY   STATUS    RESTARTS   AGE
pod/immich-cnpg-main-1   1/1     Running   0          28m
pod/immich-cnpg-main-2   1/1     Running   0          27m
pod/immich-redis-0       1/1     Running   0          3m39s
```

## Migration Step 1, while pgvecto.rs is installed.

- Exec into pod "immich-cnpg-main-1"
- run: `psql immich`
- run: 

```bash
SELECT atttypmod as dimsize
    FROM pg_attribute f
    JOIN pg_class c ON c.oid = f.attrelid
    WHERE c.relkind = 'r'::char
    AND f.attnum > 0
    AND c.relname = 'smart_search'::text
    AND f.attname = 'embedding'::text;
```

- **Write down** the dimsize NUMBER, given as output

- run: 
```bash
DROP INDEX IF EXISTS clip_index;
DROP INDEX IF EXISTS face_index;
ALTER TABLE smart_search ALTER COLUMN embedding SET DATA TYPE real[];
ALTER TABLE face_search ALTER COLUMN embedding SET DATA TYPE real[];
```

When all went OK it looks like this (NUMBER can be different):

```bash
postgres@immich-cnpg-main-1:/$ psql immich
psql (16.3 (Debian 16.3-1.pgdg110+1))
Type "help" for help.

immich=# SELECT atttypmod as dimsize
    FROM pg_attribute f
    JOIN pg_class c ON c.oid = f.attrelid
    WHERE c.relkind = 'r'::char
    AND f.attnum > 0
    AND c.relname = 'smart_search'::text
    AND f.attname = 'embedding'::text;
 dimsize 
---------
     512
(1 row)

immich=# DROP INDEX IF EXISTS clip_index;
DROP INDEX IF EXISTS face_index;
ALTER TABLE smart_search ALTER COLUMN embedding SET DATA TYPE real[];
ALTER TABLE face_search ALTER COLUMN embedding SET DATA TYPE real[];
DROP INDEX
DROP INDEX
ALTER TABLE
ALTER TABLE
immich=# 
```

## Migration Step 2, change deployment to VectorChord

- Add to your .Values
```yaml
    cnpg:
      main:
        type: vectorchord
```
Check:
- run: `kubectl get deployments,pods -n immich`

After deployment, most likely `immich-cnpg-main-2` is upgraded and `immich-cnpg-main-1` in a CrashLoopBackOff state, when that is the case:
- run: `kubectl delete pod immich-cnpg-main-1 -n immich`

Make sure the machinelearning and microservices will be scaled down again:
- run: `kubectl scale --replicas=0 deployment/immich-machinelearning -n immich`
- run: `kubectl scale --replicas=0 deployment/immich-microservices -n immich`

Check if all is in the desired state:
- run: `kubectl get deployments,pods -n immich`

```bash
kubectl get deployments,pods -n immich
NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/immich                   0/0     0            0           58m
deployment.apps/immich-machinelearning   0/0     0            0           58m
deployment.apps/immich-microservices     0/0     0            0           58m

NAME                     READY   STATUS    RESTARTS   AGE
pod/immich-cnpg-main-1   1/1     Running   0          2m57s
pod/immich-cnpg-main-2   1/1     Running   0          7m26s
pod/immich-redis-0       1/1     Running   0          7m27s
```

Check if image vectorchord is used:
- run: `kubectl get pods -n immich -o yaml| grep "image:"`
```bash
kubectl get pods -n immich -o yaml| grep "image:"
      image: ghcr.io/tensorchord/cloudnative-vectorchord:16.10-0.5.3
      image: ghcr.io/cloudnative-pg/cloudnative-pg:1.27.1
      image: ghcr.io/tensorchord/cloudnative-vectorchord:16.10-0.5.3
      image: ghcr.io/cloudnative-pg/cloudnative-pg:1.27.1
      image: ghcr.io/tensorchord/cloudnative-vectorchord:16.10-0.5.3
      image: ghcr.io/cloudnative-pg/cloudnative-pg:1.27.1
      image: ghcr.io/tensorchord/cloudnative-vectorchord:16.10-0.5.3
      image: ghcr.io/cloudnative-pg/cloudnative-pg:1.27.1
      image: docker.io/bitnamisecure/redis:latest@sha256:142ab4d0c251bcf5466fffd33766350af718a6725cb926710be19fad00b2b035
      image: sha256:63a40000acab0440264e4176e2345571beb8f1097e0355f8d216768bdf4be7f0
```

## Migration Step 3, while VectorChord is installed.

- Exec into pod "immich-cnpg-main-2"  (most lickely main-1 is now a read-only, so therefore we use main-2)
- run: `psql immich`
- run, with **Replacing <number> with the number from step 1**: 
```bash
CREATE EXTENSION IF NOT EXISTS vchord CASCADE;
ALTER TABLE smart_search ALTER COLUMN embedding SET DATA TYPE vector(<number>);
ALTER TABLE face_search ALTER COLUMN embedding SET DATA TYPE vector(512);
```

When all is OK it looks like this:

```bash
postgres@immich-cnpg-main-2:/$ psql immich
psql (16.10 (Debian 16.10-1.pgdg12+1))
Type "help" for help.

immich=# CREATE EXTENSION IF NOT EXISTS vchord CASCADE;
ALTER TABLE smart_search ALTER COLUMN embedding SET DATA TYPE vector(512);
ALTER TABLE face_search ALTER COLUMN embedding SET DATA TYPE vector(512);
NOTICE:  installing required extension "vector"
CREATE EXTENSION
ALTER TABLE
ALTER TABLE
immich=# 
```

If you get this as output:
```bash
ERROR:  cannot execute CREATE EXTENSION in a read-only transaction
ERROR:  cannot execute ALTER TABLE in a read-only transaction
ERROR:  cannot execute ALTER TABLE in a read-only transaction
```
Exec into the other CNPG pod and try again.

## Testing

- Remove:
```yaml
    workload:
      main:
        replicas: 0
```

- Now let it all deploy, all pods will be go up include machinelearning and microservices

- Check the logs: Immich will now create new indices using VectorChord, will looks like this:

```json
Postgres notice: {
  severity_local: 'INFO',
  severity: 'INFO',
  code: '00000',
  message: 'maintain: number_of_formerly_allocated_pages = 0',
  file: 'algo.rs',
  line: '100',
  routine: 'vchord::index::vchordrq::algo::maintain'
}
```

- When the logs indicate:

```
[Nest] 22  - 10/23/2025, 9:09:26 PM     LOG [Api:NestApplication] Nest application successfully started
[Nest] 22  - 10/23/2025, 9:09:26 PM     LOG [Api:Bootstrap] Immich Server is listening on http://[::1]:10323 [v2.1.0] [production] 
[Nest] 22  - 10/23/2025, 9:10:26 PM     LOG [Api:MachineLearningRepository] Machine learning server became healthy (http://immich-machinelearning:10003).
```

- All went OK

## Change chart version

- Change your `chart version` to `25.0.0`
- Remove:
```yaml
    cnpg:
      main:
        type: vectorchord
```

- You are ready to use Immich again! Have fun!

## References

The origin material for this guide is available on the [Immich site](https://docs.immich.app/administration/postgres-standalone#migrating-to-vectorchord) -> Migration steps (manual).

## Support

If you have any issues with following this guide, we can be reached using [Discord](https://discord.gg/tVsPTHWTtr) for real-time feedback and support.
