class CreateDeckRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :deck_recipes do |t|
      t.integer :user_id
      t.integer :square_id
      t.boolean :is_released,default: false, null: false
      t.text :theme

      t.timestamps
    end
  end
end
