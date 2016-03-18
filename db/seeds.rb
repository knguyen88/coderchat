MessageDelivery.delete_all
Message.delete_all
User.delete_all

5.times do |index|
  User.create(name: "User #{index}",
              email: "user#{index}@test.test",
              password: 'password',
              password_confirmation: 'password')
end