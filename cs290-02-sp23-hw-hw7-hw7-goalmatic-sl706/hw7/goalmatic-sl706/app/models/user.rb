class User < ApplicationRecord
  has_secure_password
  has_many :activities, dependent: :destroy
  has_many :challenges, dependent: :destroy
  has_many :badge_awards, dependent: :destroy
  has_many :badges, through: :badge_awards

  def email=(value)
    super(value.downcase)
  end
end
