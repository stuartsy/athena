require "json"

filePath = Dir.pwd
folderPath = filePath + "/CS107"
Dir.chdir folderPath
dirStruct = Dir.new Dir.pwd

course = Course.find_by_name("CS107")

dirStruct.each do |file|
    rawFile = File.read(file)
    json = JSON.parse(file)

    text = json["history"][0]["content"]
    title = json["history"][0]["subject"]
    date = json["history"][0]["created"]

    # Create the object update

    update.course = course
end

Dir.chdir filePath
folderPath = filePath + "/CS103"
Dir.chdir folderPath
dirStruct = Dir.new Dir.pwd

course = Course.find_by_name("CS103")

dirStruct.each do |file|
    rawFile = File.read(file)
    json = JSON.parse(file)

    text = json["history"][0]["content"]
    title = json["history"][0]["subject"]
    date = json["history"][0]["created"]

    # Create the object update

    update.course = course
end