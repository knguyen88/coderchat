class CreateMessageDeliveries < ActiveRecord::Migration
  def change
    create_table :message_deliveries do |t|
      t.integer :message_id
      t.integer :recipient_id
      t.boolean :seen

      t.timestamps null: false
    end

    add_foreign_key :message_deliveries, :messages, column: :message_id, index: true
    add_foreign_key :message_deliveries, :users, column: :recipient_id, index: true
  end
end
