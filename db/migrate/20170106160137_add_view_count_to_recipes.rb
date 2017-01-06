class AddViewCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :view_count, :integer, null: false, default: 0
  end
end
