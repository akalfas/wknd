```
sudo docker buildx build \
--push \
--cache-to=type=registry,ref=akgha.azurecr.io/wknd:cache,mode=min \
--cache-from=type=registry,ref=akgha.azurecr.io/wknd:cache \
--tag akgha.azurecr.io/wknd:one \
https://github.com/akalfas/wknd.git

```


