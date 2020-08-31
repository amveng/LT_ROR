# frozen_string_literal: true

class BanerTopImgUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/baner_top"
  end

  process resize_to_fill: [1920, 600]

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def filename
    @name ||= "#{model.id}.#{file.extension}" if original_filename
  end
end
