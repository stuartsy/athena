class CreatePiazzaPosts < ActiveRecord::Migration
  def change
    create_table :piazza_posts do |t|
    	t.text :body
    	t.text :title
    	t.string :date
    	t.integer :course_id
      t.timestamps
    end
  end
end
