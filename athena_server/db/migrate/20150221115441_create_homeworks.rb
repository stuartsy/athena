class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
    	t.text :title
    	t.text :body
    	t.text :link
    	t.string :date
    	t.integer :course_id
      t.timestamps
    end
  end
end
