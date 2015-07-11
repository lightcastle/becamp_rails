Becamp::Application.routes.draw do

  # devise_for :users

  root 'content#index'

  get '/faq', to: 'content#faq'
  # get '/about', to: 'content#about'
  get '/schedule', to: 'content#schedule'
  get '/sponsors', to: 'content#sponsors'
  get '/contact', to: 'content#contact'

  get '/past_schedules', to: 'content#past'
  get '/schedule_2014', to: 'content#schedule_2014'
  get '/schedule_2013', to: 'content#schedule_2013'
  get '/schedule_2012', to: 'content#schedule_2012'
  get '/schedule_2011', to: 'content#schedule_2011'
  get '/schedule_2010', to: 'content#schedule_2010'
  get '/schedule_2009', to: 'content#schedule_2009'
  get '/schedule_2008', to: 'content#schedule_2008'
  get '/schedule_2007', to: 'content#schedule_2007'

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
  get '/auth/failure', to: redirect('/')

  get '/register', to: 'users#register'
  put '/register', to: 'users#register'
  get '/mailing_list', to: 'users#email'
  post '/mailing_list', to: 'users#email'
end
