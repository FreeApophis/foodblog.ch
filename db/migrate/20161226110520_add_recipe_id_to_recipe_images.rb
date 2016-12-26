class AddRecipeIdToRecipeImages < ActiveRecord::Migration[5.0]
  def change
    add_column :recipe_images, :recipe_id, :integer, null: false, default: 1	
    change_column :recipe_images, :recipe_id, :integer, null: false
  end
end
