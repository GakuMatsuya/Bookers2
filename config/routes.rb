Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  root to: "homes#top"
  resources :books
  resources :users, only: [:edit, :update, :index, :show]
end
