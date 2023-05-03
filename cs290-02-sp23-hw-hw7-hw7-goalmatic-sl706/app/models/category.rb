class Category < ApplicationRecord
    has_many :challenges
    has_many :badges
end
