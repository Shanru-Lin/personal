module BadgeAwardService

    def self.award_badges(activity)
      Badge.all.each do |badge|
        next unless badge.awardable?(activity)
        BadgeAward.create! badge: badge, user: activity.user
      end
    end
  
  end