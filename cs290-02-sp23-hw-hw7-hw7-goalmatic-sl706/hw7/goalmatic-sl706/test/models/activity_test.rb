require "test_helper"

class ActivityTest < ActiveSupport::TestCase

  test "the amount of the activity is positive" do
    user = users(:one)
    challenge = Challenge.new(name:"sleep more", user: user)
    activity = Activity.new(name:"go to bed at 11",amount: 0, challenge: challenge, user: user)
    assert activity.invalid?
    assert activity.errors[:amount].any?
  end

end
