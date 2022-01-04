class Kitchen < ApplicationRecord
  belongs_to :user
  has_one :fridge
  has_one :freezer
  has_one :pantry
  has_many :items
  
end
