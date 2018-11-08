require 'test_helper'

class CryptoControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get crypto_home_url
    assert_response :success
  end

end
