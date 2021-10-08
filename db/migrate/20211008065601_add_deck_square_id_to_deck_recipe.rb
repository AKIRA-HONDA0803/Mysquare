class AddDeckSquareIdToDeckRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :deck_recipes, :deck_square_id, :integer
  end
end
