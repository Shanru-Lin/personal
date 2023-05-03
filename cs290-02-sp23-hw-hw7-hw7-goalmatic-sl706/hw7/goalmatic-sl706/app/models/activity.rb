class Activity < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  after_create :update_challenge_progress_create
  after_destroy :update_challenge_progress_destroy
  after_create :award_badges

  def award_badges
    BadgeAwardService.award_badges(self)
  end

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def update_challenge_progress_create
    challenge.activity_created(self)
  end

  def update_challenge_progress_destroy
    challenge.activity_destroyed(self)
  end

end
