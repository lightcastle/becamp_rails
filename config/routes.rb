Becamp::Application.routes.draw do

  # devise_for :users

  root 'content#index'

  get '/faq', to: 'content#faq'
  # get '/about', to: 'content#about'
  get '/schedule', to: 'content#schedule'
  get '/sponsors', to: 'content#sponsors'
  get '/contact', to: 'content#contact'

  get '/admin', to: 'admin#index'
  get '/admin/mailing', to: 'admin#mailing'
  get '/admin/registered/null', to: 'admin#registered_nil'
  get '/admin/registered/true', to: 'admin#registered_true'
  get '/admin/registered/true/first', to: 'admin#registered_true_first_time'
  get '/admin/registered/false', to: 'admin#registered_false'
  get '/admin/all', to: 'admin#all'

  get '/signin', to: 'sessions#new', as: :signin
  get '/signout', to: 'sessions#destroy', as: :signout
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/register', to: 'users#register'
  put '/register', to: 'users#register'
  get '/mailing_list', to: 'users#email'
  post '/mailing_list', to: 'users#email'
end
