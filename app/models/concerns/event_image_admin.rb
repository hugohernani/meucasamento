module EventImageAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :assets do

        end
      end
    end
  end
end
