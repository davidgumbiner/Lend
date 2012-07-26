class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester_id
      t.integer :lendable_id

      t.timestamps
    end
    
    add_index :requests, :requester_id
    add_index :requests, :lendable_id
    add_index :requests, [:requester_id, :lendable_id], unique: true
  end
end
