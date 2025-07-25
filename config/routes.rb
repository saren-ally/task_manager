Rails.application.routes.draw do
  root "home#index"
  get "tasks", to: "tasks#index", as: :tasks
  get "tasks/new", to: "tasks#new", as: :new_task
  get "/tasks/:id", to: "tasks#show", as: :task
  # edit
  get "/tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "tasks/:id", to: "tasks#update", as: :update_task
  post "tasks/find", to: "tasks#find", as: :find_task
  post "tasks", to: "tasks#create", as: :create_task
  delete "tasks/:id/delete", to: "tasks#delete", as: :task_delete
end
