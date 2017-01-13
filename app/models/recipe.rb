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
    total = 0.0

    recipe_ingredients.each do |ri|
      total += ri.calculate_calories
    end

    update_attribute(:calorific_value, total / portions)
  end

  def recipe_ingredient_calories recipe_ingredient
    cv_kg = recipe_ingredient.ingredient.calorific_value * 10
    kg_per_g = 0.001

    case recipe_ingredient.unit.category
      when 'volume'
        return cv_kg * recipe_ingredient.amount * recipe_ingredient.unit.unit_factor * recipe_ingredient.ingredient.density
      when 'weight'
        return cv_kg * recipe_ingredient.amount * recipe_ingredient.unit.unit_factor
      when 'piece'
        return cv_kg * recipe_ingredient.amount * recipe_ingredient.ingredient.piece * kg_per_g
      else 
        raise 'unknown unit'
    end
  rescue
    0
  end
end
