class CreateSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :squares do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :image_id
      t.boolean :is_completed
      t.boolean :is_released

      t.timestamps
    end
  end
end
