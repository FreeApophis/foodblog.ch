# encoding: utf-8

class RecipeImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/recipe_images/#{model.id}"
  end

  process :store_file_size

  def store_file_size
    if file && model
      model.size  = File.size(file.file)
    end
  end

  version :thumb do
     process :resize_to_fill => [160, 90]
  end

  version :slide do
     process :resize_to_fill => [1200, 675]
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path([version_name, "default_recipe_image.png"].compact.join('_'))
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
