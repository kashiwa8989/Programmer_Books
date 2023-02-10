class ChangeColumnNullOnRelationships < ActiveRecord::Migration[6.1]
  def change
    change_column_null :relationships, :follower_id, true
    change_column_null :relationships, :followed_id, true
  end
end
