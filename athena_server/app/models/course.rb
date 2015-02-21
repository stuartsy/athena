class Course < ActiveRecord::Base
	has_many :homeworks
	has_many :piazza_posts
	has_many :resources
	has_many :updates
end
