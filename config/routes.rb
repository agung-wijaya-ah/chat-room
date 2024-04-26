Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root controller: :rooms, action: :index
  # Defines the root path route ("/")
  # root "articles#index"
end
