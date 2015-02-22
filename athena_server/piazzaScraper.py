from piazza_api import Piazza
from pprint import pprint
import os
import json

p = Piazza()
p.user_login('thomklau@stanford.edu', 'thomaslau')

f = open('userProfile.txt','w')
json.dump(p.get_user_profile(), f)
f.close()

rawUserData = open('userProfile.txt')
jsonUserData = json.load(rawUserData)
rawUserData.close()

for i in jsonUserData["all_classes"]:
    classConnection = p.network(i)
    posts = classConnection.iter_all_posts(limit=100000)

    className = jsonUserData["all_classes"][i]["num"]
    # if className == "CS 103":
    #     course = Course.find_by_name("CS103")
    # elif className == "CS 110":
    #     course = Course.find_by_name("CS110")
    # else:
    #     continue


    os.chdir("/Users/sarayeva/Downloads")
    if not os.path.exists("/Users/sarayeva/Downloads/" + className):
    	os.mkdir("/Users/sarayeva/Downloads/" + className)
    os.chdir("/Users/sarayeva/Downloads/" + className)

    postCount = 0
    for post in posts:
    	tags = post["tags"]
    	if "instructor-note" not in tags:
    		continue

    	postCount = postCount + 1
    	fileName = "post" + str(postCount) + ".txt"
    	curPostFileStream = open(fileName, 'w')
    	json.dump(post, curPostFileStream)
        curPostFileStream.close()