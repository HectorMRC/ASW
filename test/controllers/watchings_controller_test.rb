require 'test_helper'

class WatchingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watching = watchings(:one)
  end

  test "should get index" do
    get watchings_url
    assert_response :success
  end

  test "should get new" do
    get new_watching_url
    assert_response :success
  end

  test "should create watching" do
    assert_difference('Watching.count') do
      post watchings_url, params: { watching: { issue_id: @watching.issue_id, user_id: @watching.user_id } }
    end

    assert_redirected_to watching_url(Watching.last)
  end

  test "should show watching" do
    get watching_url(@watching)
    assert_response :success
  end

  test "should get edit" do
    get edit_watching_url(@watching)
    assert_response :success
  end

  test "should update watching" do
    patch watching_url(@watching), params: { watching: { issue_id: @watching.issue_id, user_id: @watching.user_id } }
    assert_redirected_to watching_url(@watching)
  end

  test "should destroy watching" do
    assert_difference('Watching.count', -1) do
      delete watching_url(@watching)
    end

    assert_redirected_to watchings_url
  end
end
