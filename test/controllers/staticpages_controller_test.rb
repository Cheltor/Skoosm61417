require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get allbiz" do
    get staticpages_allbiz_url
    assert_response :success
  end

end
