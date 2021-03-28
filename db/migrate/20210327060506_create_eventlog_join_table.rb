class CreateEventlogJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :eventlog, id: false do |t|
      t.bigint :attendee_id
      t.bigint :event_id
      t.bigint :host_id
  end

  add_index :eventlog, :host_id
  add_index :eventlog, :event_id
  add_index :eventlog, :attendee_id
  end
end
