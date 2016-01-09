Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  get 'signup' => 'users#new'
  root 'static_pages#home'

  resources :users

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
