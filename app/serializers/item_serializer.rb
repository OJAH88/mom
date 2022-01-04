class ItemSerializer < ActiveModel::Serializer
  attributes :id, :imgurl, :name, :food_group, :description, :amount, :measurement_type, :in_kitchen, :in_shopping_list, :recipe_id, :food_log_id, :kitchen_id, :user_id, :in_fridge, :in_freezer, :in_pantry, :item
end