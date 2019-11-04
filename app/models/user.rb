class User < ApplicationRecord
    has_many :lists

    has_many :ratings
    has_many :movie_ratings, through: :ratings, source: :movie

    has_many :discussions
    has_many :movies, through: :discussions

    has_many :replies
    has_many :disc_replies, thhrough: :replies, source: :discussion

    has_secure_password

    validates :username, uniqueness: true
    validates :username, :password, presence: true
end
