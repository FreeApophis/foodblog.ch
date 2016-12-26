class AddSlugsToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :slug, :string, uniq: true
    add_column :recipes, :slug, :string, uniq: true
    add_column :ingredients, :slug, :string, uniq: true
    add_column :users, :slug, :string, uniq: true
  end
end
