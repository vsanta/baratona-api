Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  get 'search_by_text/:text_to_search', to: 'google_place_api#search_by_text', as: 'search_by_text'
  resources :users, only:[:create]
  resources :events
end
