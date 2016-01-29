Rails.application.routes.draw do

  namespace :api do  
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :movies
        get :add_movie
        get :remove_movie
        get :recommended_movies
      end
    end

    resources :movies, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :users
      end
    end
  end

end
