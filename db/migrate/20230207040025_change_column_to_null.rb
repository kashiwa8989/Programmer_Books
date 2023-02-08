class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :books, :genre_id, true
  end
end
