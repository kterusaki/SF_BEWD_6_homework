Rails.application.routes.draw do
  resources :posts do
  	resources :comments
  end
  put 'posts/:id/vote' => 'posts#voting'

  root 'posts#index'
end
