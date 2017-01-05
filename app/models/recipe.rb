class Recipe < ApplicationRecord
  include PublicActivity::Common

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

  def calculate_calories
    calories = 0.0
    recipe_ingredients.each do |i|
    end
    calories
  end
end
