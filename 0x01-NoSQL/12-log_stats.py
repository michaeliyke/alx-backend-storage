#!/usr/bin/env python3
"""Provides some stats about Nginx logs stored in MongoDB"""


def log_stats(nginx):
    """Provides some stats about Nginx logs stored in MongoDB"""

    all_ = nginx.count_documents({})
    get = nginx.count_documents({'method': 'GET'})
    post = nginx.count_documents({'method': 'POST'})
    put = nginx.count_documents({'method': 'PUT'})
    patch = nginx.count_documents({'method': 'PATCH'})
    delete = nginx.count_documents({'method': 'DELETE'})
    status = nginx.count_documents({'method': 'GET', 'path': '/status'})

    print(f"{all_} logs")
    print("Methods:")
    print(f"    method GET: {get}")
    print(f"    method POST: {post}")
    print(f"    method PUT: {put}")
    print(f"    method PATCH: {patch}")
    print(f"    method DELETE: {delete}")
    print(f"{status} status check")


if __name__ == "__main__":
    from pymongo import MongoClient
    client = MongoClient('mongodb://127.0.0.1:27017')
    log_stats(client.logs.nginx)
