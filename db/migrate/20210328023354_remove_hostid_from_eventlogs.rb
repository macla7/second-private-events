class RemoveHostidFromEventlogs < ActiveRecord::Migration[6.1]
  def change
    remove_index :eventlogs, :host_id
    remove_column :eventlogs, :host_id, :bigint
  end
end
