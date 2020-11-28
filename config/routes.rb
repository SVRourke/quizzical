Rails.application.routes.draw do
  root to: "static#welcome"
  
  # Sessions Routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Sign Up Routes
  get 'sign-up', to: 'users#new'
  post 'sign-up', to: 'users#create'
  
  resources :users, only: [:show, :new, :create, :update, :destroy]
  resource :dashboards, only: :show
  
  resources :groups, only: [:index, :new, :create, :show] do
    resources :enrollments, only: :create
    resources :quizzes, only: [:new, :create, :show]
  end
  
  resources :quizzes, except: [:new, :show, :edit, :create, :update, :destroy] do
    member do
      post 'publish', to: 'quizzes#publish'
    end
    resources :questions, only: [:new, :create, :destroy]
  end
  
end