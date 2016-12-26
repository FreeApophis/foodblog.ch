class RemoveDescriptionFromRecipeImage < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipe_images, :description
  end
end
