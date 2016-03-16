Rails.application.routes.draw do
  root to: redirect('/login')
  get '/login', to: 'users#login'
  get '/register', to: 'users#register'
  post '/register', to: 'users#create'
end
