module EventImageAdmin
  extend ActiveSupport::Concern

  included do
    def create_associated_image(image)
      assets.create(attachment: image)
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
