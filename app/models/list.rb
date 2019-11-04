class List < ApplicationRecord
  belongs_to :user

  has_many :list_items
  has_many :movie, through: :list_items
end
