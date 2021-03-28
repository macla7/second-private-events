class RenameEventlog < ActiveRecord::Migration[6.1]
  def change
    rename_table :eventlog, :eventlogs
  end
end
