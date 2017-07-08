Rails.application.routes.draw do
  
 
  resources :application
  root 'application#index'
  
  root 'militars#index'
  
  root 'acessorios#index'
  root 'municaos#index'
  
    root 'kenias#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
