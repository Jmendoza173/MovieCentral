class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :created_at
  
    has_many :ratings
    has_many :lists
    has_many :discussions
    has_many :replies
end