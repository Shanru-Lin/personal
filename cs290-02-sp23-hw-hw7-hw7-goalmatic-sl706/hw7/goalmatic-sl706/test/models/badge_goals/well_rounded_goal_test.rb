require "test_helper"

class WellRoundedGoalTest < ActiveSupport::TestCase

    setup do    
        @user = User.create!(email:"sl706@duke.edu", password:"111111")

        @exercise = Category.create!(name: "exercise") 
        @nutrition = Category.create!(name: "nutrition")
        @reading = Category.create!(name: "reading")   
        
        @read_challenge = Challenge.create!(name: "read", category: @reading, user: @user)

        @badge_well_round = Badge.create!(name:"3x Overacheiver", goal_type: "BadgeGoals::WellRoundedGoal", count: 3)
        
        @badge_one = Badge.create!(name:"one", category: @exercise, goal_type: "BadgeGoals::DoubleProgressGoal", count: 1)
        @badge_two = Badge.create!(name:"two", category: @nutrition, goal_type: "BadgeGoals::DoubleProgressGoal", count: 1)
        @badge_three = Badge.create!(name:"three", category: @reading, goal_type: "BadgeGoals::DoubleProgressGoal", count: 1)
       
    end

    test "goal is achieved if the activity's user has badge_awards in a number of different categories" do  
        activity_yes = Activity.create!(name: "yes", challenge: @read_challenge, amount:20, user: @user)
        BadgeAward.create!(badge: @badge_one, user: @user)
        BadgeAward.create!(badge: @badge_two, user: @user)
        BadgeAward.create!(badge: @badge_three, user: @user)
        @user.reload
        assert @badge_well_round.goal.achieved?(activity_yes)
    end

    test "goal is not acheived if you do not have badge_awards in a number of different categories" do
        activity_no = Activity.create!(name: "no", challenge: @read_challenge, amount:15, user: @user)
        BadgeAward.create!(badge: @badge_one, user: @user)
        BadgeAward.create!(badge: @badge_one, user: @user)
        @user.reload
        assert !@badge_well_round.goal.achieved?(activity_no)
    end

end
