class Friendship < ActiveRecord::Base
  def self.befriend(my_id, your_id)
    Friendship.create(my_id: my_id, friend_id: your_id)
    Friendship.create(my_id: your_id, friend_id: my_id)
  end

  def self.unfriend(my_id, your_id)
    Friendship.where(my_id: my_id, friend_id: your_id).delete_all
    Friendship.where(my_id: your_id, friend_id: my_id).delete_all
  end
end
