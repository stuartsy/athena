class AnnouncementsController < ApplicationController
	def testscript
		require "net/http"
		require "json"
		require "rubygems"

# courseName = ARGV[0]
# courseURL = ARGV[1]

courseName = "PWR1"
courseURL = "https://rhetoricofgaming.wordpress.com/blogging/page/4/"

course = Course.new(name: courseName)
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

k = 0
json["AnnouncementBody"].each do |sivayetski|

	if json["AnnouncementHeader"][k] != nil
		curHeader = json["AnnouncementHeader"][k]["Header"]
	end
	if(api == "CS106B")
	curDate = json["AnnouncementDate"][k+1]["Date"]
	else
	curDate = json["AnnouncementDate"][k]["Date"]
	end
	curDescription = json["AnnouncementBody"][k]["Description"]

	exam = false
	hw = false

	if curDescription.match(/midterm/i)
		exam = true
	end
	if curDescription.match(/final/i)
		exam = true
	end	
	if curDescription.match(/exam/i)
		exam = true
	end
	if curDescription.match(/test/i)
		exam = true
	end

	if curDescription.match(/hw/i)
		hw = true
	end
	if curDescription.match(/assignment/i)
		hw = true
	end	
	if curDescription.match(/problem/i)
		hw = true
	end
	if curDescription.match(/homework/i)
		hw = true
	end

	puts curDate
	update = Update.new(title: curHeader, date: Time.parse(curDate), body: curDescription, isHW: hw, isExam: exam, isPiazza: false)
	update.course = course
	update.save
	k = k + 1 

	@courses = Course.all
end


end

def post_course
	course = Course.new(name: params[:courseName], syllabusLink: params[:courseID])
	course.save
	render :nothing => true
end

end
