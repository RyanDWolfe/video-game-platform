class DeveloperSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :games
end
