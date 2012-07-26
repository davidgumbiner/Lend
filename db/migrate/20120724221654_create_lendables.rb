class CreateLendables < ActiveRecord::Migration
  def change
    create_table :lendables do |t|
      t.string :name
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :lendables, [:user_id, :created_at]
  end
end
