class AddUserIdToCardcomments < ActiveRecord::Migration[6.0]
  def change
    add_column :cardcomments, :user_id, :bigint
  end
end
