class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.string :image
      t.string :description
      t.string :body 

      t.timestamps
    end
  end
end
