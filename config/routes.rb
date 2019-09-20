Rails.application.routes.draw do
  resources :portfols, except: [:show]
  get 'portfol/:id', to: 'portfols#show', as: :portfol_show
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

  root to: 'pages#home'  
end
