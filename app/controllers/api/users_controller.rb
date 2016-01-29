module Api  
  class UsersController < Api::BaseController

    before_action :set_resource, only: [:destroy, :show, :update, :users, :movies, :add_movie, :remove_movie, :recommended_movies]
    before_action :load_movie, only: [:add_movie, :remove_movie]

    def movies
    end

    def add_movie
      if @user.movies.exclude?(@movie)
        @user.movies << @movie
        render "api/movies/show", status: :ok
      else
        render json: ["User already has this movie"], status: :unprocessable_entity
      end
    end

    def remove_movie
      if @user.movies.include?(@movie)
        @user.movies.delete(@movie)
        render "api/movies/show", status: :ok
      else
        render json: ["User already does not has this movie"], status: :unprocessable_entity
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
