module EventImageAdmin
  extend ActiveSupport::Concern

  included do
    require 'exifr/jpeg'
    def create_associated_image(image)
      capture_date = EXIFR::JPEG.new(image.tempfile).date_time_original rescue nil
      assets.create(attachment: image, capture: capture_date.try(:to_datetime))
    end

    rails_admin do
      edit do
        configure :type do
          visible false
        end
      end
    end
  end
end
