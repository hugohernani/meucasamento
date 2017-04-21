module WeddingSupportAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :bank_accounts do
          label "Contas de Banco"
          help false
          active true
        end
      end
    end
  end
end
