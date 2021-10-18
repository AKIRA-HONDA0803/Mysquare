class AddPositionToDeckSquare < ActiveRecord::Migration[5.2]
  def change
    add_column :deck_squares, :position, :integer, default: 0, null: false

    DeckSquare.order(:updated_at).each.with_index(1) do |deck_square, index|
      deck_square.update_column :position, index
    end
    add_column :deck_squares, :row_order, :integer
  end
end
