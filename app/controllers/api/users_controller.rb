module Api  
  class UsersController < Api::BaseController

    private

      def user_params
        params.permit(:email, :first_name, :second_name)
      end

      def query_params
        params.permit(:user_id, :email, :first_name, :second_name)
      end

  end
end
