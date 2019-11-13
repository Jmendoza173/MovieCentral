class Movie < ApplicationRecord
    has_many :list_items
    has_many :lists, through: :list_items

    has_many :ratings
    has_many :user_ratings, through: :ratings, source: :user

    has_many :discussions
    has_many :users, through: :discussions

    validates :api_id, uniqueness: true
end
