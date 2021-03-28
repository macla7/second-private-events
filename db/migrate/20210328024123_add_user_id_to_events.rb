class AddUserIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :user_id, :string
    add_index :events, :user_id
  end
end
