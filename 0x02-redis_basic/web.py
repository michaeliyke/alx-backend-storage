#!/usr/bin/env python3
"""Script to get the content of a web page"""

from typing import Callable
import functools
import redis
import redis.exceptions
import requests

conn = redis.Redis()


def cache_results(method: Callable[[str], str]) -> Callable:
    """cache the result with an expiration time of 10 seconds"""
    @functools.wraps(method)
    def wrapper(url: str) -> str:
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
        key = f"count:{url}"
        conn.incr(key)
        return method(url)
    return wrapper


@track_url
@cache_results
def get_page(url: str) -> str:
    """Get the content of a web page"""
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for 4xx and 5xx errors
    return response.text


if __name__ == '__main__':
    url = "http://slowwly.robertomurray.co.uk"
    url = "https:// google.com"

    try:
        print(get_page(url))
        print(get_page(url))
    except requests.exceptions.RequestException as e:
        print(f"Error fetching the URL: {e}")
    except redis.exceptions.ConnectionError as e:
        print(f"Redis error: {e}")
