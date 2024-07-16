#!/usr/bin/env python3
"""
Add the top 10 of the most present IPs in the collection nginx
of the database logs
"""


def log_stats(nginx):
    """Provides some stats about Nginx logs stored in MongoDB"""

    all_ = len(list(nginx.find({})))
    get = len(list(nginx.find({'method': 'GET'})))
    post = len(list(nginx.find({'method': 'POST'})))
    put = len(list(nginx.find({'method': 'PUT'})))
    patch = len(list(nginx.find({'method': 'PATCH'})))
    delete = len(list(nginx.find({'method': 'DELETE'})))
    status = len(list(nginx.find({'method': 'GET', 'path': '/status'})))

    print(f"{all_} logs")
    print("Methods:")
    print(f"    method GET: {get}")
    print(f"    method POST: {post}")
    print(f"    method PUT: {put}")
    print(f"    method PATCH: {patch}")
    print(f"    method DELETE: {delete}")
    print(f"{status} status check")


def log_stats_ext(mongo_collection):
    """Log stats"""
    return mongo_collection.aggregate([
        {
            '$group': {
                '_id': '$ip',
                'count': {
                    '$sum': 1
                }
            }
        },
        {
            '$sort': {
                'count': -1
            }
        },
        {
            '$limit': 10
        }
    ])


if __name__ == "__main__":
    from pymongo import MongoClient

    client = MongoClient('mongodb://127.0.0.1:27017')
    logs_collection = client.logs.nginx

    log_stats(logs_collection)
    top_ips = log_stats_ext(logs_collection)

    print("IPs:")
    for ip in top_ips:
        print("   {}: {}".format(ip.get('_id'), ip.get('count')))
