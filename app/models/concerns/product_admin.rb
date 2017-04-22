module ProductAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        # configure :image do
        #   label "Anexo"
        #   help false
        #   active true
        # end
      end
    end
  end
end
