require 'test_helper'

class FriendlistControllerTest < ActionDispatch::IntegrationTest
  test "should get friend" do
    get friendlist_friend_url
    assert_response :success
  end

end
