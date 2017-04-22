module WeddingSupportAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        exclude_fields :products
        configure :stores do
          label "Lojas"
          help false
          read_only true
          active
        end
        configure :bank_accounts do
          label "Contas de Banco"
          help false
          active true
        end
        configure :wedding_list do
          label "Lista de Casamento"
          help false
          active true
        end
      end
    end
  end
end
