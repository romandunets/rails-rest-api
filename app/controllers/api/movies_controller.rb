module Api  
  class MoviesController < Api::BaseController

    private

      def movie_params
        params.permit(:title, :year, :description)
      end

      def query_params
        params.permit(:movie_id, :title, :year, :description)
      end

  end
end
