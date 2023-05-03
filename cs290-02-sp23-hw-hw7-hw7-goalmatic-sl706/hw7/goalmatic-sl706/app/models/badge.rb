class Badge < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badge_awards, dependent: :destroy
  has_many :users, through: :badge_awards

  def goal
    @goal ||= goal_type? ? goal_type.constantize.new(self) : nil
  end

  def awardable?(activity)
    !awarded?(activity) &&
    goal.present? &&
    goal.achieved?(activity)
  end

  def awarded?(activity)
    BadgeAward.exists?(
      badge_id: id,
      user_id: activity.user_id,
      challenge_id: activity.challenge_id)
  end

end
