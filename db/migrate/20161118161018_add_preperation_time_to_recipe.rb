class AddPreperationTimeToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :preparation_time, :integer
    add_column :recipes, :cooking_time, :integer
    add_column :recipes, :calories, :integer
    add_column :recipes, :portions, :integer
    add_column :recipes, :difficulty, :integer
  end
end
