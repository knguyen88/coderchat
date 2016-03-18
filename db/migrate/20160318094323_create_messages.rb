class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id

      t.timestamps null: false
    end

    add_foreign_key :messages, :users, column: :sender_id, index: true
  end
end
