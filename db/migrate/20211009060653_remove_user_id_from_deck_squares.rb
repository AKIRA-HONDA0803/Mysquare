class RemoveUserIdFromDeckSquares < ActiveRecord::Migration[5.2]
  def change
    remove_column :deck_squares, :user_id, :integer
  end
end
