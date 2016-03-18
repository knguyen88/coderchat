MessageDelivery.delete_all
Message.delete_all
Friendship.delete_all
User.delete_all

5.times do |index|
  User.create(name: "User #{index}",
              email: "user#{index}@test.test",
              password: 'password',
              password_confirmation: 'password')
end

user1 = User.find_by_email('user1@test.test')
user2 = User.find_by_email('user2@test.test')
user3 = User.find_by_email('user3@test.test')

Friendship.create(my_id: user1.id,
                  friend_id: user2.id)
Friendship.create(my_id: user2.id,
                  friend_id: user1.id)

Friendship.create(my_id: user1.id,
                  friend_id: user3.id)
Friendship.create(my_id: user3.id,
                  friend_id: user1.id)