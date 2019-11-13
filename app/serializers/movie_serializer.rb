class MovieSerializer < ActiveModel::Serializer
    attributes :id, :title, :api_id, :poster_path
  
    has_many :ratings
    # has_many :list_items
    has_many :discussions
    
end