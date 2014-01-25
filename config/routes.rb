Becamp::Application.routes.draw do

  devise_for :users

  root 'content#index'

  get 'about', to: 'content#about'
  get 'schedule', to: 'content#schedule'
  get 'sponsors', to: 'content#sponsors'
  get 'contact', to: 'content#contact'

  resources :email, :only => [:new, :create]

end
