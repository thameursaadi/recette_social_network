class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.decimal :value
      t.integer :user_id
      t.string :recipe_id

      t.timestamps null: false
    end
  end
end
