Rails.application.routes.draw do
  # resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "questions/:user_id", to: 'questions#show'
  get 'questions/mine', to: 'questions#my_questions'

  resources :questions do
    resources :comments
  end

  get 'users/profile', to: 'users#show'

  post 'users/profile/update', to: 'users#update'

  post 'users/:id/promote', to: 'users#promote'

  post 'users/:id/demote', to: 'users#demote'
  
  get 'users/getallofthem/:q', to: 'users#index'
  get 'users/getallofthem/', to: 'users#index'

  post 'users/:id/delete', to: 'users#delete'
  # get 'users/:id', to: 'users#getUser'

  post 'questions/:id/deletebyadmin', to: 'questions#deletePost'

  # post 'question', to: 'questions#create'
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
end
