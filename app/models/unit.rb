class Unit < ApplicationRecord
  enum category: [ :weight, :volume, :piece ]

  belongs_to :recipe_ingredients

  validates :name, presence: true
  validates :abbrevation, presence: true
  validates_numericality_of :unit_factor, greater_than: 0.0
end
