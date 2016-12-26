class RenameImageTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :images, :recipe_images
  end
end
