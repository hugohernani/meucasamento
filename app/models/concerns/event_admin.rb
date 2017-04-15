module EventAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
      end
    end
  end
end
