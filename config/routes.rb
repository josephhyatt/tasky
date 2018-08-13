Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :tasks do
		member do
			put :change
		end
	end
	
  root 'pages#home'
	get 'about' => 'pages#about'
end
