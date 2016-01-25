module Api  
  class MoviesController < Api::BaseController

    before_action :load_movie, only: [:users]

    def users
    end

    private

      def movie_params
        params.permit(:title, :year, :description)
      end

      def query_params
        params.permit(:movie_id, :title, :year, :description)
      end

      def load_movie
        @movie = Movie.find(params[:movie_id])
      end

  end
end
