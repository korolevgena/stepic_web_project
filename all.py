#!/usr/bin/python
import os

print os.environ.get("QUERY_STRING", "No Query String in url")