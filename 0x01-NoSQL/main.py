#!/usr/bin/env python3
""" 12-main """

log_stats = __import__('12-log_stats').log_stats

if __name__ == "__main__":
    from pymongo import MongoClient
    client = MongoClient('mongodb://127.0.0.1:27017')
    log_stats(client.logs.nginx)
