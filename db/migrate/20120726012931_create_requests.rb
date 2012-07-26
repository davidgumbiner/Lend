class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester_id
      t.integer :item_id

      t.timestamps
    end
    
    add_index :requests, :requester_id
    add_index :requests, :item_id
    add_index :requests, [:requester_id, :item_id], unique: true
  end
end
