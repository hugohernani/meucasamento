module AccountRoleAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        scopes [:unscoped]
      end
    end
  end
end
