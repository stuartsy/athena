class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.string :description
    	t.string :link
    	t.integer :course_id
      t.timestamps
    end
  end
end
