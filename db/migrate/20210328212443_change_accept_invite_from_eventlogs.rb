class ChangeAcceptInviteFromEventlogs < ActiveRecord::Migration[6.1]
  def change
    change_column :eventlogs, :invite_accept, :boolean
  end
end
