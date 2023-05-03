require "test_helper"

class WellRoundedGoalTest < ActiveSupport::TestCase

  setup do
    @user = User.create!(email: "cg269@duke.edu", password_digest: "secret")
    @ball = Category.create!(name: "Ball")
    @party = Category.create!(name: "Party")
    @exercise = Category.create!(name: "Exercise")
    @badge_test = Badge.create!(name: "3x Overacheiver", goal_type: "BadgeGoals::WellRoundedGoal", count: 3)
    @badge_ball = Badge.create!(name: "Balled Twice As Hard As Planned", goal_type: "BadgeGoals::DoubleProgressGoal", count: 5, category: @ball)
    @badge_party = Badge.create!(name: "Partied Twice As Hard As Planned", goal_type: "BadgeGoals::DoubleProgressGoal", count: 5, category: @party)
    @badge_exercise = Badge.create!(name: "Exercised Twice As Hard As Planned", goal_type: "BadgeGoals::DoubleProgressGoal", count: 5, category: @exercise)
    @ball_18 = Challenge.create!(name: "Ball 18 hours a week", category: @ball, user: @user)
  end

  test "goal is achieved when an activity is created and the user has badge_awards in any 3 different categories" do
    balled_7_hours = Activity.create!(note: "Balled 7 Hours", amount: 7, challenge: @ball_18, user: @user)
    BadgeAward.create!(badge: @badge_ball, user: @user)
    BadgeAward.create!(badge: @badge_party, user: @user)
    BadgeAward.create!(badge: @badge_exercise, user: @user)
    @user.reload
    assert @badge_test.goal.achieved?(balled_7_hours)
  end

  test "goal is not acheived when an activity is created and the user has badge_award in fewer than 3 different categories" do
    balled_6_hours = Activity.create!(note: "Balled 6 Hours", amount: 6, challenge: @ball_18, user: @user)
    BadgeAward.create!(badge: @badge_ball, user: @user)
    BadgeAward.create!(badge: @badge_party, user: @user)
    @user.reload
    assert !@badge_test.goal.achieved?(balled_6_hours)
  end

end