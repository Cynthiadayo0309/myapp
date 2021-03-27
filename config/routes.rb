Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get 'boards', to: 'boards#index'
  get 'boards', to: 'boards#show'
  get 'boards', to: 'boards#calendar'
  get 'boards/show', to: 'boards#show'
  get 'events', to: 'events#index'
  get 'seasons', to: 'seasons#index'

  resources :articles  

  get 'voices', to: 'voices#index'
  get 'recruits', to: 'recruits#index'
 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
end
