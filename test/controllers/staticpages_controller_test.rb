require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get faq" do
    get staticpages_faq_url
    assert_response :success
  end

end
