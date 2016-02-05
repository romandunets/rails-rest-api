Rails.application.routes.draw do

  namespace :api do  
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :movies
        get :recommended_movies
        post :rate_movie
        post :unrate_movie
      end
    end

    resources :movies, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :users
      end
    end
  end

end
