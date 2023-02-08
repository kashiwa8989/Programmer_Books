class ChangeDatatypeGenreIdOfBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :genre_id, :integer
  end
end
