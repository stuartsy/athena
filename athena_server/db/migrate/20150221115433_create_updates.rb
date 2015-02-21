class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
    	t.string :title
    	t.string :body
    	t.string :link
    	t.date :date
    	t.integer :course_id
      t.timestamps
    end
  end
end
