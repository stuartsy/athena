class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.text :description
    	t.text :link
    	t.integer :course_id
      t.timestamps
    end
  end
end
