class Unit < ApplicationRecord
  enum category: [ :weight, :volume, :piece ]

  belongs_to :recipe_ingredients
end
