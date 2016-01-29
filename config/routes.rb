Rails.application.routes.draw do

  namespace :api do  
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :movies
        get :recommended_movies
        post :add_movie
        post :remove_movie
      end
    end

    resources :movies, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :users
      end
    end
  end

end
