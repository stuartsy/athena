require "net/http"
require "json"
require "rubygems"

courseName = ARGV[0]
courseURL = ARGV[1]

course = Course.new(name: CourseName)
diffbotURLToken = ""
api = ""

case courseName
	when courseName = "CS 106B"
        api = "CS106B"
	when courseName = "CS 103"
	    api = "CS103"
	when courseName = "CS 106L"
	    api = "CS106L"
	when courseName = "CS 166"

	when courseName = "CS 161"
	
	when courseName = "CS 143"

	when courseName = "CS 106A"	
end	



response = Net::HTTP.get_response("diffbot.com","/api/CS103?token=73659789c3c2aa6d84fd9812b5ba57dc&url=http://web.stanford.edu/class/archive/cs/cs166/cs166.1146/")
my_JSON = JSON.parse(response.body) #this must show the JSON contents
p my_JSON["AnnouncementBody"]
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

