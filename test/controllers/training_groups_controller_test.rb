require 'test_helper'

class TrainingGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get training_groups_join_url
    assert_response :success
  end

end
