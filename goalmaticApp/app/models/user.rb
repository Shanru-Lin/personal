class User < ApplicationRecord
  has_secure_password
  has_many :activities, dependent: :destroy
  has_many :challenges, dependent: :destroy

  def email=(value)
    super(value.downcase)
  end
end
