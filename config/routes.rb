Rails.application.routes.draw do
  get '/login', to: 'users#show_login_form'
  post '/login', to: 'users#do_login'

  post '/logout', to: 'users#do_logout'

  get '/register', to: 'users#show_register_form'
  post '/register', to: 'users#do_create_user'

  get '/friends', to: 'users#show_friend_list'
  post '/friends/add', to: 'users#befriend', as: :befriend
  post '/friends/remove', to: 'users#unfriend', as: :unfriend
  post '/friends/block', to: 'users#block_friend', as: :block_friend
  post '/friends/unblock', to: 'users#unblock_friend', as: :unblock_friend

  get '/messages/inbox', to: 'messages#show_inbox', as: :inbox
  get '/messages/outbox', to: 'messages#show_outbox', as: :outbox
  get '/messages/new', to: 'messages#show_new_message_form', as: :send_new_message
  post '/messages/new', to: 'messages#do_send_message'

  get '/messages/:id', to: 'messages#view_message', as: :view_message
end
