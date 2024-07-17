#!/usr/bin/env python3
"""0. Writing strings to Redis"""
import redis
import uuid
from typing import Union


class Cache:
    """0. Writing strings to Redis"""

    def __init__(self):
        """The redis cache constructor"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, float, int, bytes]) -> str:
        """Generate a random key, store the data in Redis using the key
        and return the key"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
