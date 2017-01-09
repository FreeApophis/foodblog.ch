class Recipe < ApplicationRecord
  include PublicActivity::Common

  acts_as_taggable

  extend FriendlyId
  friendly_id :name, use: :slugged

  paginates_per 16

  has_many :preparation_steps
  accepts_nested_attributes_for :preparation_steps, allow_destroy: true

  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  has_many :images, class_name: 'RecipeImage', foreign_key: 'recipe_id'
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates_numericality_of :portions, greater_than_or_equal_to: 1

  def update_calories
    value = 0

    recipe_ingredients.each do |ri|
      value += recipe_ingredient_calories(ri)
    end

    update_attribute(:calorific_value, value)
  end

  def recipe_ingredient_calories recipe_ingredient
    case recipe_ingredient.unit.category
      when :volume
        return 10
      when :weight      
        return 100
      when :piece
        return 1000
    end
    0
  end
end
