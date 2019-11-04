class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :replies
  has_many :users, through: :replies
end
