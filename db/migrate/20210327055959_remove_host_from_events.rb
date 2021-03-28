class RemoveHostFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :host, :string
  end
end
