# Mumble SRV Failover
Creating a failover Mumble server by using SRV records.

Sends ping to master server every minute. If exit value of nc is other than 0, then use murmur-user-wrapper to start up a failover server with master server's config. Continue sending ping's to master server and when it comes back up kill failover server.

## Setting up DNS records

You need two servers for this
A records
```
A master.example.com 192.168.1.10
A failover.example.com 192.168.1.11
```
SRV records
(_service._protocol.name TTL priority weight port target) Note failover having lesser priority
```
SRV _mumble._tcp.mumble AUTO 1 5 62294 master.example.com
SRV _mumble._tcp.mumble AUTO 10 5 62294 failover.example.com
```
## Master server
1. Rsync .ini, .sqlite and certifacates to failover server with cronjob

## Failover server
1. Run `mumble-failover.sh` as a cronjob

```
* * * * * ~/mumble-failover.sh
```

