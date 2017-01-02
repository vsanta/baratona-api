Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  get 'search', to: 'application#search'
  resources :users, only:[:create]

end
