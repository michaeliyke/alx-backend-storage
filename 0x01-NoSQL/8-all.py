#!/usr/bin/env python3
"""Function that lists all documents in a collection"""
from pymongo.collection import Collection


def list_all(mongo_collection: Collection):
    """Lists all documents in a collection"""
    return mongo_collection.find()
