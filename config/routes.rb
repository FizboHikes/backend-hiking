Rails.application.routes.draw do
  resources :hikes
  resources :profiles
  devise_for :users, defaults: { format: :json }
  get 'users/:user_id/hikes' => 'hikes#user_hikes'
  post 'users/:user_id/add_friend' => 'hikes#add_friend'
  get 'users/:user_id/friend_hikes' => 'hikes#friend_hikes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
