require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
	test "create comment success" do
		user = FactoryGirl.create(:user)
		sign_in user
		place = FactoryGirl.create(:place)
		assert_difference 'place.comments.count' do
      		post 	:create,

      				:place_id => place.id,
      				:comment => {
        					:rating  => '1_star',
        					:message => 'This place is awful'
    				}
    	end

    	assert_redirected_to place_path(place)
    	comment = Comment.last
    	assert_equal u, comment.user

	end

	test "create comment validation error" do
    	user = FactoryGirl.create(:user)
    	sign_in user
    	place = FactoryGirl.create(:place)
    	assert_no_difference 'place.comments.count' do
      		post :create, 
      				:place_id => place.id,
      				:comment => {
        				:rating  => 'yolo',
        				:message => 'This place is awful'
      				}
    end
    assert_response :unprocessable_entity
  end



end # of class
