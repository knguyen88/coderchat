class MessageDelivery < ActiveRecord::Base
  belongs_to :message
  belongs_to :recipient, class_name: 'User'

  def self.received_messages(recipient)
    blocked_ids = Friendship.where(my_id: recipient.id, is_blocked: true).pluck(:friend_id).map(&:to_i)
    query = MessageDelivery
                .includes(:message)
                .where('message_deliveries.recipient_id': recipient.id)
                .order('message_deliveries.created_at DESC')
    if blocked_ids.present?
      query = query.where.not('messages.sender_id': blocked_ids)
    end
    query
  end

  def self.sent_messages(sender)
    MessageDelivery
        .includes(:recipient)
        .joins(:message)
        .where('messages.sender_id' => sender.id)
        .order('message_deliveries.created_at DESC')
  end
end
