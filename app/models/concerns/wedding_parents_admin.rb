module WeddingParentsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :assets do
          label "Imagens de Pais"
          help "Adicione a imagem do pai e a imagem da mãe"
          active true
          inline_add do
            owner_instance = bindings[:object]
            Asset.where(owner: owner_instance).count < 2
          end
        end
      end
    end
  end
end
