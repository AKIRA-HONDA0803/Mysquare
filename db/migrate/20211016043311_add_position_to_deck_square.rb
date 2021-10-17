class AddPositionToDeckSquare < ActiveRecord::Migration[5.2]
  def change
    add_column :deck_squares, :position, :integer, default: 0, null: false
    add_column :deck_squares, :row_order, :integer
  end
end
