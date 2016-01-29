module Api  
  class MoviesController < Api::BaseController

    before_action :set_resource, only: [:destroy, :show, :update, :users]

    private

      def movie_params
        params.permit(:title, :year, :description)
      end

      def query_params
        params.permit(:movie_id, :title, :year, :description)
      end

  end
end
