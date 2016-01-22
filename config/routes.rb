Rails.application.routes.draw do

  namespace :api do  
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      get :add_movie
    end

    resources :movies, only: [:index, :show, :create, :update, :destroy]
  end

end
