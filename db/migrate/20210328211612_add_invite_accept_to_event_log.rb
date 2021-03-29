class AddInviteAcceptToEventLog < ActiveRecord::Migration[6.1]
  def change
    add_column :eventlogs, :invite_accept, :bool
  end
end
