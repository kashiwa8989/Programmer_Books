class CreateBookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_comments do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.text :comment, null: false
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
