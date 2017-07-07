Rails.application.routes.draw do
  
  resources :application
  root 'application#index'
  
  resources :militars
  root 'militars#index'
  
  resources :acessorios
  root 'acessorios#index'
  resources :municaos
  root 'municaos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
