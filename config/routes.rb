Rails.application.routes.draw do
  resources :spices, only: [:destroy, :create, :update, :index, :show]
end
  