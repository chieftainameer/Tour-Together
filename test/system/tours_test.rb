require "application_system_test_case"

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:one)
  end

  test "visiting the index" do
    visit tours_url
    assert_selector "h1", text: "Tours"
  end

  test "creating a Tour" do
    visit tours_url
    click_on "New Tour"

    fill_in "Budget", with: @tour.budget
    fill_in "Description", with: @tour.description
    fill_in "Pickup spots", with: @tour.pickup_spots
    fill_in "Places", with: @tour.places
    fill_in "Reg date ends", with: @tour.reg_date_ends
    fill_in "Services", with: @tour.services
    fill_in "Title", with: @tour.title
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "updating a Tour" do
    visit tours_url
    click_on "Edit", match: :first

    fill_in "Budget", with: @tour.budget
    fill_in "Description", with: @tour.description
    fill_in "Pickup spots", with: @tour.pickup_spots
    fill_in "Places", with: @tour.places
    fill_in "Reg date ends", with: @tour.reg_date_ends
    fill_in "Services", with: @tour.services
    fill_in "Title", with: @tour.title
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour" do
    visit tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour was successfully destroyed"
  end
end
