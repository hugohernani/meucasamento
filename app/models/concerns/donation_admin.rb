module DonationAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        scopes [:not_as_product]
      end
    end
  end
end
