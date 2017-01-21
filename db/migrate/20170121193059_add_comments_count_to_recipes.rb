class AddCommentsCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :comments_count, :integer, null: false, default: 0
  end
end
