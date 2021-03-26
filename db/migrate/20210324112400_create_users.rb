class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :party_id

      t.timestamps
    end
    add_index :users, :party_id
  end
end
