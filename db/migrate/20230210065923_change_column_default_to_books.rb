class ChangeColumnDefaultToBooks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :books, :rate, from: "0", to:  nil
  end
end
