require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "the amount on activity must be positive" do
    user = users(:one)
    activity = Activity.new(amount: -1, challenge_id: 1, user: user)
    assert activity.invalid?
    assert activity.errors[:amount].any? 
  end
  
end
