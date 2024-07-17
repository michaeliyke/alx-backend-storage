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

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Generate a random key, store the data in Redis using the key
        and return the key"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: callable = None):
        """Get the data from the key"""
        data = self._redis.get(key)
        if fn:
            return fn(data)
        return data

    def get_str(self, key: str) -> str:
        """
        Calling this method will call self.get()
        and supply the correct conversion function for a string
        """
        return self.get(key=key, fn=lambda x: x.decode('utf-8'))

    def get_int(self, key: str) -> int:
        """
        Calling this method will call self.get()
        and suply the correct conversion function for an integer
        """
        return self.get(key=key, fn=int)
