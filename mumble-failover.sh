#!/bin/sh

HOST=hostname
PORT=62294

nc -z $HOST $PORT >/dev/null
value=$?

if [ "$value" = 0 ] && pgrep -x "murmurd" >/dev/null; then
    murmur-user-wrapper -k
fi

if [ "$value" != 0 ]; then
    murmur-user-wrapper
fi

