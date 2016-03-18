class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :my_id
      t.integer :friend_id
      t.boolean :is_blocked, default: false
      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :my_id
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
