Rails.application.routes.draw do
  get '/login', to: 'users#show_login_form'
  post '/login', to: 'users#do_login'
  get '/register', to: 'users#show_register_form'
  post '/register', to: 'users#do_create_user'
end
