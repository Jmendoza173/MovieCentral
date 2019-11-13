class ListSerializer < ActiveModel::Serializer
  attributes :id, :list_name, :list_items
  has_many :list_items
end
