class CreatePreparationSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :preparation_steps do |t|
      t.integer :recipe_id, null: false, index: true
      t.text :text
      t.integer :sort_order, null: false, index: true

      t.timestamps
    end
  end
end
