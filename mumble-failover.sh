#!/bin/sh

HOST=hostname
PORT=62294

nc -vz $HOST $PORT >/dev/null
value=$?

if [ "$value" = 0 ] && pgrep -x "murmurd" >/dev/null; then
    murmur-user-wrapper -k && echo "murmur killed"
fi

if [ "$value" != 0 ]; then
    murmur-user-wrapper && echo "starting murmur"
fi

