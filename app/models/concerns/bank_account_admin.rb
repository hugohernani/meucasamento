module BankAccountAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :name do
          label "Nome do titular da conta"
        end
        configure :bank do
          label "Nome do Banco"
        end
        configure :account do
          label "Número da Conta"
        end
        configure :agency do
          label "Número da Agência"
        end
        configure :operation do
          label "Número da operação"
        end
      end
    end
  end
end
