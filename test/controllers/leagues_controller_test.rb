require 'test_helper'

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @league = leagues(:one)
    @user = users(:one)
  end

  test "should get index" do
    get leagues_url
    assert_response :success
  end

  test "should get new" do
    get new_league_url
    assert_response :success
  end

  test "should create league" do
    @create = League.new
    @create.title = "Sunday League"
    @create.nums = 8
    @create.user = @user

    @create.save

    assert_equal(3, League.count)

    assert_equal(8, @create.nums)
    assert_equal(@create.title, League.first.title)
    assert_equal(1, @create.user_id)
    assert_equal("Sunday League", @create.title)
  end

  test "should show league" do
    get league_url(@league)
    assert_response :success
  end

  test "should get edit" do
    get edit_league_url(@league)
    assert_response :success
  end

  test "should update league" do
    patch league_url(@league), params: { league: { } }
    assert_redirected_to league_url(@league)
  end

  test "should destroy league" do
    assert_difference('League.count', -1) do
      delete league_url(@league)
    end

    assert_redirected_to leagues_url
  end
end
