# encoding: utf-8

class BlogHeaderImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/blog_header/#{model.id}"
  end

  version :header do
     process :resize_to_fill => [1200, 500]
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path('slide_default_recipe_image.png')
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
