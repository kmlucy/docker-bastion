# docker-bastion

### Run
```
docker run -d \
  --name=bastion \
  -v /path/to/authorized_keys:/home/bastion/.ssh/authorized_keys:ro \
  -p 2222:22 \
  ghcr.io/kmlucy/docker-ssh
```

If you want permanent host keys or to modify the `sshd_config`, copy out the ssh directory once the container is running:
```
docker cp bastion:/etc/ssh /path/to/ssh/dir
```

Then mount it during run:
```
-v /path/to/ssh/dir:/etc/ssh:ro
```

### Use
```
ssh -J bastion@bastion.fqdn:2222 target.fqdn
```
