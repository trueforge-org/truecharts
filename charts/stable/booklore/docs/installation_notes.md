---
title: Add Books Directory
---

Following is an example on how to add your own book shares:

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
