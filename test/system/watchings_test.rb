require "application_system_test_case"

class WatchingsTest < ApplicationSystemTestCase
  setup do
    @watching = watchings(:one)
  end

  test "visiting the index" do
    visit watchings_url
    assert_selector "h1", text: "Watchings"
  end

  test "creating a Watching" do
    visit watchings_url
    click_on "New Watching"

    fill_in "Issue", with: @watching.issue_id
    fill_in "User", with: @watching.user_id
    click_on "Create Watching"

    assert_text "Watching was successfully created"
    click_on "Back"
  end

  test "updating a Watching" do
    visit watchings_url
    click_on "Edit", match: :first

    fill_in "Issue", with: @watching.issue_id
    fill_in "User", with: @watching.user_id
    click_on "Update Watching"

    assert_text "Watching was successfully updated"
    click_on "Back"
  end

  test "destroying a Watching" do
    visit watchings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Watching was successfully destroyed"
  end
end
