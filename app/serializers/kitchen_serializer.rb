class KitchenSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_one :user
end
