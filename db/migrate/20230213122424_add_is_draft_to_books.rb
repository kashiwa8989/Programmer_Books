class AddIsDraftToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :is_draft, :boolean, default: false
  end
end
