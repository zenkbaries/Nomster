require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "star_rating" do

  	rating = Comment.new(:rating => '1_star').humanized_rating
	expected = "one star"   
	actual = rating
	assert_equal expected, actual 
  end
end
