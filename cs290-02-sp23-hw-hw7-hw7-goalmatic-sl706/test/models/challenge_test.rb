require "test_helper"

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "challenge name must be present" do
    user = users(:one)
    challenge = Challenge.new(category_id: 1, user: user)
    assert challenge.invalid?
    assert challenge.errors[:name].any?
  end

  test "after an activity is created, increase the challenge progress" do
      challenge = challenges(:sleep_40)
      user = users(:one)
      activity = Activity.create(amount: 6, challenge: challenge, user: user)
      assert challenge.reload.progress == 14
  end
  
  test "after an activity is destroyed, update the challenge progress" do
    challenge = challenges(:sleep_40)
    user = users(:one)
    activity = Activity.create(amount: 10, challenge: challenge, user: user)
    Activity.destroy(activity.id)
    assert challenge.reload.progress == 8
  end

end
