Rails.application.routes.draw do

  devise_for :users
  resources :application
  root 'application#index'
   
  resources :militars
  root 'militars#index'

  resources :user
  root 'user#index'
  
  resources :acessorios
  root 'acessorios#index'
  
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/perfil' => 'devise/registrations#edit'
    get '/user' => 'user#index'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
