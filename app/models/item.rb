class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :kitchen, optional: true
  belongs_to :fridge, class_name: 'Kitchen', optional: true
  belongs_to :freezer, class_name: 'Kitchen', optional: true
  belongs_to :pantry, class_name: 'Kitchen', optional: true
  belongs_to :recipe, optional: true
  belongs_to :shopping_list, optional: true
  belongs_to :food_log, optional: true



end

