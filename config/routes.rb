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
  resources :armamentos
  root 'armamentos#index'
  resources :reservas
  root 'reservas#index'
  resources :reservamunicaos
   root 'reservamunicaos#index'
  resources :reservaacessorios
  root 'reservaacessorios#index'
  resources :reservaarmamentos
  root 'reservaarmamentos#index'
  resources :municaos
  root 'municaos#index'
  resources :controles
  root 'controles#index'
  resources :cautelas
  root 'cautelas#index'
  resources :cautelamunicaos
  root 'cautelamunicaos#index'
  resources :cautelaacessorios
  root 'cautelaacessorios#index'
  resources :usermilitars
  root 'usermilitars#index'
  resources :cautelaarmamentos
  root 'cautelaarmamentos#index'
  
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/perfil' => 'devise/registrations#edit'
    get '/user' => 'user#index'
  end
  
 
 resources :controles do
     member do
       get 'fechar'=> 'controles#fechar'
       get 'abrir'=> 'controles#abrir'
     end
 end
  
 resources :cautelas do
     member do
       get 'finalizar'=> 'cautelas#finalizar'
       get 'comprovante'=> 'cautelas#comprovante'
    end
 end

end
