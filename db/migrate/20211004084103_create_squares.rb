class CreateSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :squares do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :image_id
      t.boolean :is_completed ,default: false, null: false
      t.boolean :is_released ,default: false, null: false

      t.timestamps
    end
  end
end
