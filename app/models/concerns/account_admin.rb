module AccountAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :about_us do
          help false
        end
      end
    end
  end
end
