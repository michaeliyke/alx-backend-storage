#!/usr/bin/env python3
"""Writing strings to Redis and reading them back."""

import redis


def write_to_redis():
    """Write a string to Redis."""
    r = redis.StrictRedis(host='localhost', port=6379, db=0)
    r.set


def read_from_redis():
    """Read a string from Redis."""
    r = redis.StrictRedis(host='localhost', port=6379, db=0)
    return r.get('exercise')


if __name__ == '__main__':
    write_to_redis()
    print(read_from_redis())
