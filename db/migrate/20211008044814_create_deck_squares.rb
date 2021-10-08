class CreateDeckSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :deck_squares do |t|
      t.integer :user_id
      t.integer :square_id

      t.timestamps
    end
  end
end
