class Challenge < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :badge_awards
  belongs_to :category
  belongs_to :user

  validates :name, presence: true

  def activity_created(activity)
    self.progress += activity.amount
    save
  end

  def activity_destroyed(activity)
    self.progress -= activity.amount
    save
  end
  
end
