Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'tasks', to: 'tasks#index'
  get "tasks/new", to: "tasks#new"
  get "tasks/:id", to: 'tasks#show', as: 'task'
  get "tasks/:id/edit", to: "tasks#edit", as: 'task_edit'
  post "tasks", to: "tasks#create"
  patch "tasks/:id", to: "tasks#update"
  delete "tasks/:id", to: "tasks#destroy"
  patch "tasks/:id/task_completed", to: "tasks#task_completed", as: 'task_completed'



  # Defines the root path route ("/")
  # root "articles#index"
end
