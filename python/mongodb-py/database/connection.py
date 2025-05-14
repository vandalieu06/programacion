from pymongo import MongoClient
import os
from dotenv import load_dotenv
load_dotenv()

def create_connection():
  uri =  os.getenv("URL_DB")
  client = MongoClient(uri)
  return client
