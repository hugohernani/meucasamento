module TopSliderAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        # configure :assets do
        #   help false
        #   inline_add false
        #   active true
        # end
      end
    end
  end
end
