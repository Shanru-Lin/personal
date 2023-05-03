require "test_helper"

class DoubleProgressGoalTest < ActiveSupport::TestCase

    setup do  
        @user = users(:one)   
        @sleep = categories(:sleep)
        @sleep_40 = challenges(:sleep_40)      
        @badge = Badge.create!(name:"Double Progress", category: @sleep, goal_type: BadgeGoals::DoubleProgressGoal, count: 10)
    end

    test "goal is achieved if the progress of a challenge is twice that of it's goal" do  
        activity_20= Activity.create!(name: "Double Progress", challenge: @sleep_40, amount:12, user: @user)
        activity_20.reload
        assert @badge.goal.achieved?(activity_20)
    end

    test "goal is not acheived if the progress of a challenge is not twice that of it's goal" do
        activity_15 = Activity.create!(name: "No Double Progress", challenge: @sleep_40, amount:5, user: @user)
        activity_15.reload
        assert !@badge.goal.achieved?(activity_15)
    end

end
