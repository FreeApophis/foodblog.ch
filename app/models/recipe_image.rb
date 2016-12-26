class RecipeImage < ApplicationRecord
  belongs_to :recipe

  mount_uploader :file, RecipeImageUploader
end
