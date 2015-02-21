require "net/http"
require "json"
require "rubygems"

courseName = ARGV[0]
courseURL = ARGV[1]

course = Course.new(name: CourseName)





response = Net::HTTP.get_response("diffbot.com","/api/CS103?token=73659789c3c2aa6d84fd9812b5ba57dc&url=http://web.stanford.edu/class/archive/cs/cs166/cs166.1146/")
json = JSON.parse(response.body) #this must show the JSON contents
# p json["AnnouncementBody"][0]["Description"]
# p json

i = 0
json["AnnouncementBody"]. each do |sivayetski|
	p json["AnnouncementHeader"][i]["Header"]
	p json["AnnouncementDate"][i]["Date"]
	p json["AnnouncementBody"][i]["Description"]
	p "------------"

	i = i + 1 
end