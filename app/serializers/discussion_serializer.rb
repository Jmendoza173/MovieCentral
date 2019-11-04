class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :updated_at
  has_one :user
  has_one :movie
end
