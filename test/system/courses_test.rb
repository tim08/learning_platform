require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_path

    assert_selector "h1", text: "Courses"
  end

  test "sign up for training" do
    @course = courses(:one)
    visit course_path(@course)
    first(:link, "Join").click
    fill_in "enter your email address", with: "test@mail.ru"
    click_on "Join"
    assert_text "test@mail.ru"
  end
end
