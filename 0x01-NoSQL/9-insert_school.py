#!/usr/bin/env python3
"""Function that inserts a new document in a collection based on kwargs"""
from pymongo.collection import Collection


def insert_school(mongo_collection: Collection, **kwargs) -> str:
    """Inserts a new document in a collection based on kwargs"""
    return mongo_collection.insert_one(kwargs).inserted_id
