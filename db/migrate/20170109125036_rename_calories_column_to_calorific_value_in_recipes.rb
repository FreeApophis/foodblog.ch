class RenameCaloriesColumnToCalorificValueInRecipes < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :calories, :calorific_value
  end
end
