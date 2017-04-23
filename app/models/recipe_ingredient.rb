class RecipeIngredient < ApplicationRecord

  validates :amount, presence: true
  validates :amount, numericality: true
  validates :ingredient, presence: true
  validates :unit, presence: true

  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit

  def calculate_calorific_value
    cv_kg = ingredient.calorific_value * 10
    kg_per_g = 0.001

    case unit.category
      when 'volume'
        return cv_kg * amount * unit.unit_factor * ingredient.density
      when 'weight'
        return cv_kg * amount * unit.unit_factor
      when 'piece'
        return cv_kg * amount * ingredient.piece * kg_per_g
      else 
        raise 'unknown unit'
    end
  rescue
    0
  end

end
