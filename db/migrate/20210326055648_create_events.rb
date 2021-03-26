class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :host
      t.datetime :time
      t.string :location

      t.timestamps
    end
    add_index :events, :host
  end
end
