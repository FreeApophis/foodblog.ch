class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, index: true, null: false
      t.references :ingredient, index: true, null: false
      t.references :unit, index: true, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
