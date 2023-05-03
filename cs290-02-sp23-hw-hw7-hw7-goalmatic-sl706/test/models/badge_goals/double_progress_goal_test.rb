require "test_helper"

class DoubleProgressGoalTest < ActiveSupport::TestCase

  setup do
    @study = categories(:study)
    @badge = Badge.create!(name: "Studied Twice As Hard As Planned", goal_type: "BadgeGoals::DoubleProgressGoal", count: 5, category: @study)
    @study_18 = challenges(:study_18)
    @user = users(:one)
  end

  test "goal is achieved when an activity is created and the progress is twice that of the goal" do
    studied_7_hours = Activity.create!(note: "Studied 7 Hours", amount: 7, challenge: @study_18, user: @user)
    studied_7_hours.reload
    assert @badge.goal.achieved?(studied_7_hours)
  end

  test "goal is not acheived when an activity is created and the progress is NOT twice that of the goal" do
    studied_6_hours = Activity.create!(note: "Studied 6 Hours", amount: 6, challenge: @study_18, user: @user)
    studied_6_hours.reload
    assert !@badge.goal.achieved?(studied_6_hours)
  end

end