class Recipe < ApplicationRecord
  include PublicActivity::Common

  has_many :preparation_steps
  accepts_nested_attributes_for :preparation_steps, allow_destroy: true

  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  belongs_to :author, class_name: 'User'
end
