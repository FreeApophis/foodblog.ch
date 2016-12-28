# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/avatar/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [150, 150]
  end

  version :big do
    process :resize_to_fill => [600, 600]
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path([version_name, "default_avatar.png"].compact.join('_'))
  end

   def extension_white_list
     %w(jpg jpeg  png)
   end
end
