class MessageSerializer < ActiveModel::Serializer
  attributes :id
  has_one :friendship
  has_one :user
end
