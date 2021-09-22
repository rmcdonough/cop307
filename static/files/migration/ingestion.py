import json
import boto3
import random
import datetime
import os
import time
from random import uniform
import pymongo

MongoIP = os.getenv('MONGOIP')
Login = os.getenv('LOGIN')
connection = 'mongodb://'+Login+'@'+MongoIP+'/labdb'
client = pymongo.MongoClient(connection)
db = client.labdb


def getReferrer():
    x = random.randint(1,2)
    x = x*10
    y = x+50
    data = {}
    data['custid'] = random.randint(x,y)
    lat = random.randint(-23540000,-23520000)/1000000
    long = random.randint(-46640000,-46620000)/1000000
    #print(lat)
    #print(long)
    data['loc']={}
    data['loc']['type']='Point'
    data['loc']['coordinates'] = [ lat, long]
    #data['long'] = long
    #loc : { type: "Point", coordinates: [ -73.97, 40.77 ] },
    data['action'] = random.choice(['walking','running','byking','walking','byking','jogging'])
    now = datetime.datetime.now()
    time.sleep(.5)
    str_now = now.isoformat()
    data['trans_timestamp'] = str_now
    print(data)
    return data

def lambda_handler(event, context):
   begining = datetime.datetime.now()
   newtime = begining
   print(connection)
   print(db)
   #for doc in db.customers.find():
   #    print(doc)
   while (newtime - begining).total_seconds()<55:
        #data = json.dumps(getReferrer())
        #print(data)
        result=db.locations.insert(getReferrer())
        print(result)
        newtime = datetime.datetime.now()
   print ('Cleaned end execution.')
