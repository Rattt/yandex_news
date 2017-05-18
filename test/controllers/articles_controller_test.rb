require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get last_active' do
    get root_url
    assert_response :success
  end
end
