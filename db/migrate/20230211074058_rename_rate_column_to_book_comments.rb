class RenameRateColumnToBookComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_comments, :rate, :star
  end
end
