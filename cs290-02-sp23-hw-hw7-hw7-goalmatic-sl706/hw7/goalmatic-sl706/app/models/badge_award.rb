class BadgeAward < ApplicationRecord
    belongs_to :badge
    belongs_to :user
    belongs_to :challenge, optional: true
end
