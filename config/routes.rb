Rails.application.routes.draw do
  get "tasks/all_tasks", as: :all_tasks
  root "home#index"
  get "/tasks/:id", to: "tasks#index"
end
