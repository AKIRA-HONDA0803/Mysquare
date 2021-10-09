class AddColumnsToDeckSquares < ActiveRecord::Migration[5.2]
  def change
    add_column :deck_squares, :user_id, :integer
    add_column :deck_squares, :deck_recipe_id, :integer
  end
end
