class FoodLogSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :eaten_at, :item, :amount, :measurement_type, :item_id
  has_one :user
end
