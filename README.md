## Quickstart

```
docker run -d --name squid -p 3128:3128 --restart=always \
  gmauleon/squid
```

## Configuration

By default squid will output access logs to stdout and cache log to stderr and it will cache only in memory  
You can change the configuration by mounting your own configuration file like so:
```
docker run -d --name squid -p 3128:3128 --restart=always \
  -v /host/etc/squid/squid.conf:/etc/squid/squid.conf \
  gmauleon/squid
```

You can also mount the cache and/or log directory if you want:
```
docker run -d --name squid -p 3128:3128 --restart=always \
  -v /host/var/log/squid:/var/log/squid \
  -v /host/var/cache/squid:/var/cache/squid \
  gmauleon/squid
```
Or change the cache and log directory completely by specifying the environment variables `SQUID_LOG_DIR` and `CACHE_LOG_DIR`  
Note that you will also have to change the squid configuration to match your variables, those are only used to ensure squid has the correct access via the docker-entrypoint.sh

## Tips

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
