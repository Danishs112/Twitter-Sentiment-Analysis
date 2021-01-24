
import tweepy
import time
import pandas as pd
import re
from nltk.stem import PorterStemmer
import boto3
import os
import requests
import json
import random
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
import datetime
import argparse


#twitter authenication
auth= tweepy.OAuthHandler('9ZPpI5c3yLi8ZtSrzHAcIsppc'
,'W81EmOuPneZh39dwbK1nq0cjnc9iqpzKQqy4tu2pW8ruinsNbg')
auth.set_access_token('1044242601480675335-91v8RfyCaOJjjybdjGFYy3AhOe07Gk','DK9KGTSbvXj31DksRv3G8W09SA3eznwoYw7QJ5D1rKZge')
auth_api=tweepy.API(auth)
#print(auth_api)

#amazon authenication
client = boto3.client('comprehend')

#mysql_connection
ap = argparse.ArgumentParser()

ap.add_argument("-p", "--preprocess", type=str, default="thresh",
    help="type of preprocessing to be done")
args = vars(ap.parse_args())

#the select query to the get the data from the database 
#data which will be extracted from the database are the ceritificate id and path of the image that are stored in the database

conn = mysql.connector.connect(host='localhost',
                                         database='twitter_sentiment',
                                         user='root',
                                         password="")
#query for the extracting the data from the database
sql_select_Query = "SELECT account_name FROM account_name WHERE account_id=(SELECT max(account_id) FROM account_name)"
cursor = conn.cursor()
cursor.execute(sql_select_Query)
records = cursor.fetchall()
for row in records:
    name=row[0]
    #print(name)
        

username =name
#extract the tweet 
count = 1
tweets = tweepy.Cursor(auth_api.user_timeline,id=username).items(count)
tweets_list = [[ tweet.text] for tweet in tweets]
x= tweets_list[0][0] 


# from here ownwards tweet cleaning take place

#this step will remove the url handles and # tags
tweets =  ' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)"," ",x).split())
#it convert the tweet to lowercase
tweets = tweets.lower()

#this list convert the stop words
stop_words= ["ourselves","hers", "between", "yourself","ourselves", "hers", "between", "yourself", "but", "again",
             "there", "about", "once", "during", "out", "very", "having", "with", "they", "own", "an", "be", "some",
             "for", "do", "its", "yours", "such", "into", "of", "most", "itself", "other", "off", "is", "s", "am",
             "or", "who", "as", "from", "him", "each", "the", "themselves","until", "below", "are", "we", "these", "your", "his", "through", "don’", "nor", "me", "were", "her", "more",
             "himself", "this", "down", "should", "our", "their", "while", "above", "both",
             "up", "to", "ours", "had", "she", "all", "no","when", "at","any", "before", "them", "same", "and", "been", "have", "in", "will", "on", "does","yourselves", "then", "that", "because", "what", "over", "why", "so", "can", "did","not", "now", "under", "he", "you", "herself", "has", "just", "where", "too", "only","myself", "which", "those", "i", "after", "few", "whom", "t", "being", "if","theirs", "my", "against", "a", "by", "doing", "it", "how", "further","was", "here", "than"]
#this will the split the tweet into list
tweets = tweets.split()
d=[]
for w in tweets:
    if w not in stop_words:
        d.append(w)            
#after removal of the stopwords it will append the tweet into the list d 

# now we are using nlp library Porterstemmer to stem the words
#stemming is used in information retrieval systems like search engines.
#It is used to determine domain vocabularies in domain analysis.
#eg : likely, liked,liking it convert it to like
ps = PorterStemmer()
e=[]
for w in d:
    w=ps.stem(w)
    e.append(w)

#this step will the join the tweet
tweet_clean = " ".join(e)
#print(tweet_clean)

conn = mysql.connector.connect(host='localhost',
                                         database='twitter_sentiment',
                                         user='root',
                                         password="")
   #Creating a cursor object using the cursor() method
cursor = conn.cursor()



response = client.detect_sentiment(Text=tweet_clean,LanguageCode='en')
    #print(response['Sentiment'])
x = response['Sentiment']
#print(x)

date = datetime.datetime.now()
#print(date)
insert_stmt = (
"INSERT INTO sentiment(sentiment,dated)"
   "VALUES (%s,%s)"
)
data = (x,date)


try:
   # Executing the SQL command
   cursor.execute(insert_stmt, data)
   
   # Commit your changes in the database
   conn.commit()

except:
   # Rolling back in case of error
   conn.rollback()

#print("Data inserted")

# Closing the connection
conn.close()


