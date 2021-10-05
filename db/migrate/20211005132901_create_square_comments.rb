class CreateSquareComments < ActiveRecord::Migration[5.2]
  def change
    create_table :square_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :square_id

      t.timestamps
    end
  end
end
