require "net/http"
require "json"
require "rubygems"

courseName = ARGV[0]
courseURL = ARGV[1]

course = Course.new(name: CourseName)
course.save
diffbotURLToken = ""
api = ""

case courseName
	when courseName = "CS106B"
        api = "CS106B"
	when courseName = "CS103"
	    api = "CS103"
	when courseName = "CS106L"
	    api = "CS106L"
	when courseName = "CS166"
		api = "CS103"	
	when courseName = "CS110"
		api = "CS110"
	when courseName = "CS106A"
		api = "CS103"
	when courseName = "PWR1"
		api = "PWR"
	else
		api = "CS103"
end	


diffBotParameter = "/api/" + api + "?token=73659789c3c2aa6d84fd9812b5ba57dc&url=" + courseURL


response = Net::HTTP.get_response("diffbot.com", diffBotParameter)
json = JSON.parse(response.body)

i = 0
json["AnnouncementBody"]. each do |sivayetski|
	curHeader = json["AnnouncementHeader"][i]["Header"]
	curDate = json["AnnouncementDate"][i]["Date"]
	curDescription = json["AnnouncementBody"][i]["Description"]

	update = Update.new(title: curHeader, date: curDate, body: curDescription)
	update.save
	update.course = course
	i = i + 1 
end

