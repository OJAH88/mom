class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items
  
end
