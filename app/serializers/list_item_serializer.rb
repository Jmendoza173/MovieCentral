class ListItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :list
  has_one :movie
end
