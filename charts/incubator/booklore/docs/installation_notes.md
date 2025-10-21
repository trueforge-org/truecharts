---
title: Booklore installation notes
---

## Your own books folder-mounts

```yaml
persistence:
  ...
  #  Your own books directory (if needed)
   books:
     enabled: true
     mountPath: /books
     path: /mnt/tank/booklore/books
     server: ${NFS_SERVER_IP}
     type: nfs

   # Your own bookdrop directory for easily importing books
   bookdrop:
     enabled: true
     mountPath: /bookdrop
     path: /mnt/tank/booklore/bookdrop
     server: ${NFS_SERVER_IP}
     type: nfs
```


## Mariadb backup

```yaml
mariadb:
  enabled: true
  mariadbUsername: booklore   
    persistence:
      data:
        volsync:
          - name: booklore-db
            type: restic
            credentials: minio
            dest:
              enabled: true
            src:
              enabled: true
```
