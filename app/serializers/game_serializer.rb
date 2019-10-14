class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :genre, :developer_id, :win_parameter, :lose_parameter
  belongs_to :developer
end
