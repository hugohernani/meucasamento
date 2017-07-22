module GalleryAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :event do
          read_only true
        end
        configure :assets do
          help false
          inline_add do
            Gallery.count < 20
          end
          active true
        end
      end
    end
  end
end
