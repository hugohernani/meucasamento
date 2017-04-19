module AccountAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        include_fields :email, :name, :about_us
      end
    end
  end
end
