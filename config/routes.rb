Rails.application.routes.draw do
  root to: "static#welcome"
  
  # Sessions Routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Sign Up Routes
  get 'sign-up', to: 'users#new'
  post 'sign-up', to: 'users#create'

  # OAuth Routes
  get 'auth/google_oauth2/callback', to: 'sessions#GoogleAuth'
  get 'auth/failure', to: redirect('/')
  
  resources :users, only: [:new, :create]
  resource :dashboards, only: :show
  
  delete '/groups/:id', to: "groups#destroy", as: "delete_group"
  resources :groups, only: [:index, :new, :create, :show, ] do
    resources :enrollments, only: :create
    resources :quizzes, only: [:new, :create, :show]
  end

  post 'unenroll/:id', to: "enrollments#destroy", as: "unenroll"
  resource :notes, except: [:new]

  resources :quizzes, except: [:new, :show, :edit, :create, :update, :destroy, :index] do
    member do
      delete 'delete', to: "quizzes#destroy"
      post 'publish', to: 'quizzes#publish'
      get 'notes', to: "notes#new"
    end
    resources :questions, only: [:new, :create, :destroy]
    resources :results, only: [:new, :create]
  end
  
end