Rails.application.routes.draw do
  devise_for :users, path: '', path_name: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfols, except: [:show]
  get 'portfol/:id', to: 'portfols#show', as: :portfol_show
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  root to: 'pages#home'  
end
