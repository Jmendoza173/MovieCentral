class MovieSerializer < ActiveModel::Serializer
    attributes :id, :title, :api_id
  
    has_many :ratings
    has_many :listitems
    has_many :discussions
    
end