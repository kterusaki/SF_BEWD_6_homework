Rails.application.routes.draw do
  devise_for :users
  
  resources :posts do
  	resources :comments
  end

  patch 'posts/:id/vote' => 'posts#voting'

  root 'posts#index'
end
