#!/usr/bin/env python3
"""Provides some stats about Nginx logs stored in MongoDB"""


def log_stats(nginx):
    """Provides some stats about Nginx logs stored in MongoDB"""
    print(f"{nginx.count_documents({})} logs")
    print("Methods:")
    print(
        f"\tmethod GET: {nginx.count_documents({'method': 'GET'})}")
    print(
        f"\tmethod POST: {nginx.count_documents({'method': 'POST'})}")
    print(
        f"\tmethod PUT: {nginx.count_documents({'method': 'PUT'})}")
    print(
        f"\tmethod PATCH: {nginx.count_documents({'method': 'PATCH'})}")
    print(
        f"\tmethod DELETE: {nginx.count_documents({'method': 'DELETE'})}")
    print(f"{nginx.count_documents({'method': 'GET', 'path': '/status'})} status check")


if __name__ == "__main__":
    from pymongo import MongoClient
    client = MongoClient('mongodb://127.0.0.1:27017')
    log_stats(client.logs.nginx)
