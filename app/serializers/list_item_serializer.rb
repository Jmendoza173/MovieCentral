class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :list_id
  belongs_to :movie
end
