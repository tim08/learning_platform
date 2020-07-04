require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get info course" do
    @course = courses(:one)
    get course_path(@course)
    assert_response :success
  end

end
