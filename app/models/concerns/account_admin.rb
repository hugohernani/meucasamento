module AccountAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        include_fields :email, :password, :password_confirmation, :name,
                       :about_us
      end
    end
  end
end
