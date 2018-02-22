Rails.application.routes.draw do
  controller :pages do
    get :planner
    get :program_requirements
  end

  get 'users/new'
  get 'login', to: 'sessions#new', as: 'login'
  root to: 'sessions#new'

  resources :users
  resources :sessions
end
