class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :name
    	t.string :syllabusLink
    	t.string :calendarLink
      t.timestamps
    end
  end
end
