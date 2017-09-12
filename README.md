## Quickstart

```
docker run -d --name squid -p 3128:3128 --restart=always \
  gmauleon/squid
```

## Configuration

Squid start with the default config which only store the cache in memory  
You can specify mount points for the logs, cache and configuration file like so:
```
docker run -d --name squid -p 3128:3128 --restart=always \
  -v /host/var/log/squid:/var/log/squid \
  -v /host/var/cache/squid:/var/cache/squid \
  -v /host/etc/squid/squid.conf:/etc/squidi/squid.conf \
  gmauleon/squid
```

For best network performance use the `--network host` option which will bind your docker to the host interface with default port 3128:
```
docker run -d --name squid --network host --restart=always \
  gmauleon/squid
```

Using this has also the advantage to make squid use your host IP/network for ACL and as localhost  
So the cache manager will be accessible directly via:
```
curl localhost:3128/squid-internal-mgr/info
...
Squid Object Cache: Version 3.5.23
Build Info: 
Service Name: squid
Start Time: Tue, 12 Sep 2017 21:50:14 GMT
Current Time: Tue, 12 Sep 2017 21:53:50 GMT
...
```
