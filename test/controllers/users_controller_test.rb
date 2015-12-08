require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "user show page" do
  	user = FactoryGirl.create(:user)
  	get :show, :id => user.id
  	assert_response :success
  end

  test "user show page, not found" do
  	get :show, :id => '1'
  	assert_response :not_found
  end
end
