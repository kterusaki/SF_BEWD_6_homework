Rails.application.routes.draw do
  resources :posts
  put 'posts/:id/vote' => 'posts#voting'

  root 'posts#index'
end
