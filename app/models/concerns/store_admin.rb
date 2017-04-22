module StoreAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :products do
          label "Produtos"
          help false
          active true
        end
        # configure :image do
        #   label "Anexo"
        #   help false
        #   active true
        # end
      end
    end
  end
end
