class Recipe < ApplicationRecord
  include PublicActivity::Common

  has_many :preparation_steps
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :author, class_name: 'User'
end
