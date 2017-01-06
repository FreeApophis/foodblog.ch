class AddProteinAndFatColumnsToIngredients < ActiveRecord::Migration[5.0]
  def change
   remove_column :ingredients, :calories_per_volume
   remove_column :ingredients, :calories_per_weight
   remove_column :ingredients, :calories_per_piece

   add_column :ingredients, :density, :decimal, null: false, default: 1.0
   add_column :ingredients, :piece, :decimal, null: false, default: 1.0
   add_column :ingredients, :calorific_value, :integer, null: false, default: 0
   add_column :ingredients, :protein, :decimal, null: false, default: 0.0
   add_column :ingredients, :fat, :decimal, null: false, default: 0.0
   add_column :ingredients, :carbohydrates, :decimal, null: false, default: 0.0
   add_column :ingredients, :sugar, :decimal, null: false, default: 0.0
   add_column :ingredients, :fiber, :decimal, null: false, default: 0.0
  end
end
