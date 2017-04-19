module EventImageAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :type do
          visible false
        end
      end
    end
  end
end
