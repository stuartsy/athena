require "net/http"
require "json"
require "rubygems"
response = Net::HTTP.get_response("diffbot.com","/api/CS103?token=73659789c3c2aa6d84fd9812b5ba57dc&url=http://www.stanford.edu/class/archive/cs/cs143/cs143.1128/")
my_JSON = JSON.parse(response.body) #this must show the JSON contents
p my_JSON
