class Recipe < ApplicationRecord
  include PublicActivity::Common
  include Commentable

  has_paper_trail
  acts_as_taggable

  extend FriendlyId
  friendly_id :name, use: :slugged

  paginates_per 16

  validates :name, presence: true
  validates_numericality_of :portions, greater_than_or_equal_to: 1

  has_many :preparation_steps
  accepts_nested_attributes_for :preparation_steps, allow_destroy: true

  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  has_many :images, class_name: 'RecipeImage', foreign_key: 'recipe_id'
  accepts_nested_attributes_for :images, allow_destroy: true

  has_many :hints
  accepts_nested_attributes_for :hints, allow_destroy: true

  belongs_to :author, class_name: 'User'

  def update_calories
    total = 0.0

    recipe_ingredients.each do |ri|
      total += ri.calculate_calorific_value
    end

    update_attribute(:calorific_value, total / portions)
  end
end
