class RemovePartyIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :party_id, :string
  end
end
