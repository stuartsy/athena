class CreatePiazzaPosts < ActiveRecord::Migration
  def change
    create_table :piazza_posts do |t|
    	t.string :body
    	t.string :instructor
    	t.string :title
    	t.date :date
      t.timestamps
    end
  end
end
