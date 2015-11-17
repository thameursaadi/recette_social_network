class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :recipe_id
      t.string :title
      t.text :description
      t.text :url

      t.timestamps null: false
    end
  end
end
