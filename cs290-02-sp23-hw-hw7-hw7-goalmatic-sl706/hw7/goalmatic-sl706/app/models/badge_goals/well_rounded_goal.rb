class BadgeGoals::WellRoundedGoal < BadgeGoal
    def achieved?(activity)
        activity.user.badges.collect(&:category_id).uniq.size >= badge.count
    end
end