class ListSerializer < ActiveModel::Serializer
  attributes :id, :list_name
  has_one :user
end
