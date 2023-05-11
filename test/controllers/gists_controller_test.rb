require "test_helper"

class GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gists_create_url
    assert_response :success
  end
end
