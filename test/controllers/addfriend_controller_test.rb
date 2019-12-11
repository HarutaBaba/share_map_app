require 'test_helper'

class AddfriendControllerTest < ActionDispatch::IntegrationTest
  test "should get addfri" do
    get addfriend_addfri_url
    assert_response :success
  end

end
