require 'test_helper'

class FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get api/v1/favorites" do
    get favorite_api/v1/favorites_url
    assert_response :success
  end

end
