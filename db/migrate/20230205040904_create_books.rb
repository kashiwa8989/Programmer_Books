class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :author, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
