Rails.application.routes.draw do
  get '/login', to: 'users#show_login_form'
  post '/login', to: 'users#do_login'

  post '/logout', to: 'users#do_logout'

  get '/register', to: 'users#show_register_form'
  post '/register', to: 'users#do_create_user'

  get '/friends', to: 'users#show_friend_list'
  post '/friends/add', to: 'users#do_add_friend', as: :add_friend

  resources :messages
end
