#!/usr/bin/env python3
"""Script to get the content of a web page"""

from typing import Callable
import functools
import redis
import requests


def cache_results(method: Callable[[str], str]) -> Callable:
    """cache the result with an expiration time of 10 seconds"""
    @functools.wraps(method)
    def wrapper(url: str) -> str:
        """Wrapper function to be returned"""
        conn = redis.Redis()

        if conn.get(url):  # Check if the cache exists
            return conn.get(url).decode('utf-8')
        html = method(url)
        conn.setex(url, 10, html)  # Set the cache with 10 seconds expiration
        return html
    return wrapper


def track_url(method: Callable[[str], str]) -> Callable:
    """Track the number of times a URL is called"""
    @functools.wraps(method)
    def wrapper(url: str) -> str:
        """Wrapper function to be returned"""
        conn = redis.Redis()
        key = f"count:{url}"
        conn.incr(key)
        return method(url)
    return wrapper


@track_url
@cache_results
def get_page(url: str) -> str:
    """Get the content of a web page"""
    return requests.get(url).text


if __name__ == '__main__':
    url = "http://slowwly.robertomurray.co.uk"
    url = "https://google.com"
    print(get_page(url))
    print(get_page(url))
