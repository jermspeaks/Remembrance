require 'carrierwave/orm/activerecord'

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url

    'default_avatar.png'
  end
  

  process :resize_to_fit => [400,400]


  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
