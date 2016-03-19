class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'

  attr_accessor :seen, :seen_at

  def deliver_to(recipients)
    message_id = self.id
    recipient_ids = recipients.split(',')
    recipient_ids.each do |recipient_id|
      MessageDelivery.create(message_id: message_id, recipient_id: recipient_id)
    end
  end

  def sender?(user)
    sender_id == user.id
  end

  def recipient?(user)
    MessageDelivery.exists?(message_id: self.id, recipient_id: user.id)
  end

  def read_by?(user)
    MessageDelivery.where(message_id: self.id, recipient_id: user.id).take.seen
  end

  def read_now(user)
    MessageDelivery
        .where(message_id: self.id, recipient_id: user.id)
        .update_all(seen: true, seen_at: DateTime.now)
  end
end
