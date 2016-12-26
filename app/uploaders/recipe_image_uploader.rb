# encoding: utf-8

class RecipeImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/recipe_images/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

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
