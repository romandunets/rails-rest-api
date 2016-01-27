require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @controller = Api::UsersController.new
  end

  test 'should get index' do
    get(:index, format: :json)
    assert_response :success
    assert_not_nil assigns(:users)
  end
end
