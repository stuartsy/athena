filePath = Dir.pwd
folderPath = filePath + "/CS103"
Dir.chdir folderPath
dirStruct = Dir.new Dir.pwd

course = 0
if !Course.exists?(:name => "CS103")
    course = Course.new(name: "CS103")
    course.save
else
    course = Course.find_by_name("CS103")
end



count = Dir["**/*"].length
count = (count/3) - 1

(0..count).each do |i|
    titleName = "title" + i.to_s + ".txt"
    dateName = "date" + i.to_s + ".txt"
    bodyName = "body" + i.to_s + ".txt"

    title = File.read(titleName)
    date = File.read(dateName)
    body = File.read(bodyName)

    hw = false
    exam = false

    if body.match(/midterm/i)
        exam = true
    end
    if body.match(/final/i)
        exam = true
    end 
    if body.match(/exam/i)
        exam = true
    end
    if body.match(/test/i)
        exam = true
    end

    if body.match(/hw/i)
        hw = true
    end
    if body.match(/assignment/i)
        hw = true
    end 
    if body.match(/problem/i)
        hw = true
    end
    if body.match(/homework/i)
        hw = true
    end



    update = Update.new(title: title, date: date, body: body, isHW: hw, isExam: exam, isPiazza: true)
    update.course = course;
    update.save
end


folderPath = filePath + "/CS110"
Dir.chdir folderPath
dirStruct = Dir.new Dir.pwd

if !Course.exists?(:name => "CS110")
    course = Course.new(name: "CS110")
    course.save
else
    course = Course.find_by_name("CS110")
end
count = Dir["**/*"].length
count = (count/3) - 1

(0..count).each do |i|
    titleName = "title" + i.to_s + ".txt"
    dateName = "date" + i.to_s + ".txt"
    bodyName = "body" + i.to_s + ".txt"

    title = File.read(titleName)
    date = File.read(dateName)
    body = File.read(bodyName)

    hw = false
    exam = false

    if body.match(/midterm/i)
        exam = true
    end
    if body.match(/final/i)
        exam = true
    end 
    if body.match(/exam/i)
        exam = true
    end
    if body.match(/test/i)
        exam = true
    end

    if body.match(/hw/i)
        hw = true
    end
    if body.match(/assignment/i)
        hw = true
    end 
    if body.match(/problem/i)
        hw = true
    end
    if body.match(/homework/i)
        hw = true
    end

    update = Update.new(title: title, date: date, body: body, isHW: hw, isExam: exam, isPiazza: true)
    update.course = course;
    update.save
end