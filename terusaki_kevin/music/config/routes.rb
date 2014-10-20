Rails.application.routes.draw do
	resources :artists do
		resources :songs
	end

	resources :labels

	get 'songs', to: 'songs#all', as: 'songs'

	root 'artists#index'
end
