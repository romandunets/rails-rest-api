require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.create(email: 'testuser@mail.com')
    @controller = Api::UsersController.new
  end

  test 'should get index' do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns :users
  end

  test 'should show user' do
    get :show, id: @user, format: :json
    assert_response :success
  end
end
