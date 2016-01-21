Rails.application.routes.draw do

  namespace :api do  
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :movies, only: [:index, :show, :create, :update, :destroy]
  end

end
