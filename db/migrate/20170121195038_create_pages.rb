class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :slug
      t.text :content
      t.integer :parent_id, :null => true, :index => true
      t.integer :left, :null => false, :index => true
      t.integer :right, :null => false, :index => true
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
