Rails.application.routes.draw do
  get 'register', to: 'user_registrations#new'
  post 'register/user', to: 'user_registrations#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  get 'dashboard', to: 'dashboard#show'
  root "home#show"
end
