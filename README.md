alpine-vamp-ui
==============

This image is the alpine-vamp-ui base. It comes from [alpine-nginx][alpine-nginx].

## Build

```
docker build -t rawmind/alpine-vamp-ui:<version> .
```

## Versions

- `0.8.4` [(Dockerfile)](https://github.com/rawmind0/alpine-vamp-ui/blob/0.8.4/Dockerfile)

## Configuration

This image runs [vamp-ui][vamp-ui] with monit. It is started with nginx user/group with 10004 uid/gid.

The service is started with monit. It's listening at port 8080.

[alpine-nginx]: https://github.com/rawmind0/alpine-nginx/
[vamp-ui]: https://github.com/magneticio/vamp-ui/