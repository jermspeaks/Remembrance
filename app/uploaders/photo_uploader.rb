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
  
  # version :resized do
  #   process :resize_to_fit => [100,10000]
  # end
  process :resize_to_fit => [400,400]

  # version :large do
  #   process :resize_to_fill => [150, 150]
  # end

  # version :medium do
  #   process :resize_to_fill => [50, 50]
  # end

  # version :small do
  #   process :resize_to_fill => [35, 35]
  # end

  # version :fit_thumbnail do
  #   process :resize_to_fit => [nil, 300]
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
