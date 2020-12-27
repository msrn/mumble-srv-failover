# Mumble SRV Failover
Creating a failover Mumble server by using SRV records.

Sends ping to master server every minute. If exit value of nc is other than 0, then use murmur-user-wrapper to start up a failover server with master server's config. Continue sending ping's to master server and when it comes back up kill failover server.

## Master server
1. Rsync .ini, .sqlite and certifacates to failover server with cronjob

## Failover server
1. Run `mumble-failover.sh` as a cronjob

```
* * * * * mumble-failover.sh
```

