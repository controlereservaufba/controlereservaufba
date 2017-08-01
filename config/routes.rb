Rails.application.routes.draw do

  resources :reservaarmamentos
  devise_for :users
  resources :application
  root 'application#index'
  resources :militars
  root 'militars#index'
  resources :user
  root 'user#index'
  resources :acessorios
  root 'acessorios#index'
  resources :armamentos
  root 'armamentos#index'
  resources :reservas
  root 'reservas#index'
  resources :reservamunicaos
   root 'reservamunicaos#index'
  resources :reservaacessorios
  root 'reservaacessorios#index'
  root 'reservaarmamentos#index'
  resources :municaos
  root 'municaos#index'
  resources :controles
  root 'controles#index'
  
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/perfil' => 'devise/registrations#edit'
    get '/user' => 'user#index'
  end
  
 
 resources :controles do
     member do
       get 'baixa'=> 'controles#baixa'
      end
   end
   
   
 
 resources :controles do
     member do
       get 'show'=> 'controles#show'
      end
   end
   
   
end
