require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get '/home'
    assert_response :success

    assert_template layout: 'application'

	assert_select 'h1', 'League Generator'
	assert_select 'p', 'Some Rules:'
  end

  test "should get contact" do
    get '/contact'
    assert_response :success
  end

end
