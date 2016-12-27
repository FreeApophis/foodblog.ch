class AddCaloriesToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :calories_per_volume, :integer
    add_column :ingredients, :calories_per_weight, :integer
    add_column :ingredients, :calories_per_piece, :integer
  end
end
