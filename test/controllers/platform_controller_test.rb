require 'test_helper'

class PlatformControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get platform_index_url
    assert_response :success
  end

  test "should get show" do
    get platform_show_url
    assert_response :success
  end

end
