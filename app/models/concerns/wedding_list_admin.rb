module WeddingListAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        exclude_fields :products
      end
    end
  end
end
