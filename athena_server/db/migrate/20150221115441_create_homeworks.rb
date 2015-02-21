class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
    	t.string :title
    	t.string :body
    	t.string :link
    	t.date :date
      t.timestamps
    end
  end
end
