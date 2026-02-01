---
title: How-To
---

## Step 1: Check Server Logs (Authentication Link)

- Once the pod is running, check the logs. On first startup, the server will print an authentication / server-download link.

```yaml
kubectl logs -n hytale <podname>
```
Look for a line similar to:

Please open the following link to authenticate and download the server:
https://...

What to do:

- Open the link in your browser
- Complete the authentication
- Wait for the download to complete

## Step 2: Attach to the Server Console

After authentication, you must attach to the server console to run the command shown in the logs.

First, get the pod name:

```yaml
kubectl get pods -n hytale
```


Then attach interactively using -i -t:
```yaml
kubectl attach -n hytale <pod-name> -i -t
```

Make sure that a console opens with

```bash
>
```

and enter

```bash
/auth login device
```

This should give you another link to authenticate.

Afterwards you should be done and the server should be up and running
