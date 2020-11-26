Rails.application.routes.draw do
  root to: "static#welcome"
  
  # resources :groups do
  #   member do
  #     get 'join', action: :enroll # Maybe not necessary 
  #     post 'join', action: :submit_enrollment
  #   end
  # end
  
  # Sessions Routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Sign Up Routes
  get 'sign-up', to: 'users#new'
  post 'sign-up', to: 'users#create'

  resources :users, only: [:show, :new, :create, :update, :destroy]

  resource :dashboards, only: :show
end

# AS A STUDENT
  # Dashboard "/students/3/home"
  # Take a quiz "/group/4/quiz/10/submit"
  # Join a group "group/4/join"

  # resource :quiz, except: [:update] do
  #   member do
  #     get 'submit'
  #     post 'submit', action: :submit_quiz
  #   end
  # end
  # resources :groups, only: [:show] do
  #   resource :quiz, only: [:show] do
  #     member do
  #       get 'submit'
  #       post 'submit', action: :submit_quiz
  #     end
  #   end
  # end

  # resource :quiz, only: [:new, :create, :update]