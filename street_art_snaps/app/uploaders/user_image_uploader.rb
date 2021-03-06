class UserImageUploader < CarrierWave::Uploader::Base


  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :detail do
    process :resize_to_fit => [400, 400]
  end
end
