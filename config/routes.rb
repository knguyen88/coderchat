Rails.application.routes.draw do
  get '/login', to: 'users#login'
  get '/register', to: 'users#register'
  post '/register', to: 'users#create'
end
