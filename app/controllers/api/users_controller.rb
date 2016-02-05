module Api  
  class UsersController < Api::BaseController

    before_action :set_resource, only: [:destroy, :show, :update, :users, :movies, :rate_movie, :unrate_movie, :recommended_movies]
    before_action :load_movie, only: [:rate_movie, :unrate_movie]

    def movies
    end

    def rate_movie
      if @user.movies.exclude?(@movie)
        @user.rate_movie(@movie, params[:score])
        render "api/movies/show", status: :ok
      else
        render json: ["User has already rated this movie"], status: :unprocessable_entity
      end
    end

    def unrate_movie
      if @user.movies.include?(@movie)
        @user.unrate_movie(@movie)
        render "api/movies/show", status: :ok
      else
        render json: ["User has not rated this movie"], status: :unprocessable_entity
      end
    end

    def recommended_movies
    end

    private

      def user_params
        params.permit(:email, :first_name, :second_name)
      end

      def query_params
        params.permit(:user_id, :email, :first_name, :second_name)
      end

      def load_movie
        @movie = Movie.find(params[:movie_id])
      end

  end
end
