Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  
  root to: "homes#top"
  get "home/about" => "homes#about"
  resources :books
  resources :users, only: [:edit, :update, :index, :show]
end
