class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :author_id
      t.text :description

      t.timestamps
    end
  end
end
