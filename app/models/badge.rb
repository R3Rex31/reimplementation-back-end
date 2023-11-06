class Badge < ApplicationRecord
  def self.upload_image(image_file) # upload and save an image file for a badge
    return '' unless image_file

    image_name = image_file.original_filename
    File.open(Rails.root.join('app', 'assets', 'images', 'badges', image_name), 'wb') do |file|
      file.write(image_file.read)
    end
    image_name
  end

end
