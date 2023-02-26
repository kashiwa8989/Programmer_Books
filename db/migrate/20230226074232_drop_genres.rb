class DropGenres < ActiveRecord::Migration[6.1]
  def change
    drop_table :genres do |t|
      t.string :name, null:false

      t.timestamps
    end
  end
end
