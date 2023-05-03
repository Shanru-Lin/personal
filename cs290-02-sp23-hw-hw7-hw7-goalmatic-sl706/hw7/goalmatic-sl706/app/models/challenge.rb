class Challenge < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :activities, dependent: :destroy
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
