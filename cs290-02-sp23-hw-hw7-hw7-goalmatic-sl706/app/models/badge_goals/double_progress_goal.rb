class BadgeGoals::DoubleProgressGoal < BadgeGoal
    def achieved?(activity)
        activity.challenge.progress == 2 * badge.count && activity.challenge.category == badge.category
    end
end