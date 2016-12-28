class AddHeaderImageToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :header_image, :string
  end
end
