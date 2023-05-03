require "test_helper"

class ChallengeTest < ActiveSupport::TestCase

    test "the challenge has a name" do
        challenge = Challenge.new()
        assert challenge.invalid?
        assert challenge.errors[:name].any?
    end

    test "after an activity is created, increase the challenge progress" do
        user = users(:one)
        challenge = challenges(:sleep_40)
        activity = Activity.create(amount: 6, challenge: challenge, user: user)
        assert challenge.reload.progress == 14
    end

    test "after an activity is destroyed, decrease the challenge progress" do
        user = users(:two)
        challenge = challenges(:sleep_40)
        activity = Activity.create(amount: 6, challenge: challenge, user: user)
        Activity.destroy(activity.id)
        assert challenge.reload.progress == 8
    end

end
