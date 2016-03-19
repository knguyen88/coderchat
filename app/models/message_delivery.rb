class MessageDelivery < ActiveRecord::Base
  belongs_to :message
  belongs_to :recipient, class_name: 'User'

  def self.received_messages(recipient)
    MessageDelivery
        .includes(:message)
        .where('message_deliveries.recipient_id' => recipient.id)
        .order('message_deliveries.created_at DESC')
  end

  def self.sent_messages(sender)
    MessageDelivery
        .includes(:recipient)
        .joins(:message)
        .where('messages.sender_id' => sender.id)
        .order('message_deliveries.created_at DESC')
  end
end
