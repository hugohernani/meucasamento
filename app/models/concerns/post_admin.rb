module PostAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
    end
  end
end
