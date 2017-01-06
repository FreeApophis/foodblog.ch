class Ingredient < ApplicationRecord
  include PublicActivity::Common

  extend FriendlyId
  friendly_id :name, use: :slugged

  paginates_per 25

  validates :name, presence: true
  validates :description, presence: true

  validates_numericality_of :density, greater_than: 0.0
  validates_numericality_of :piece, greater_than_or_equal: 0.0
  validates_numericality_of :calorific_value, greater_than: 0.0
  validates_numericality_of :protein, greater_than_or_equal: 0.0
  validates_numericality_of :fat, greater_than_or_equal: 0.0
  validates_numericality_of :carbohydrates, greater_than_or_equal: 0.0
  validates_numericality_of :sugar, greater_than_or_equal: 0.0
  validates_numericality_of :fiber, greater_than_or_equal: 0.0
end
