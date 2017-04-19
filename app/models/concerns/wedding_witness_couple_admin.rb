module WeddingWitnessCoupleAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :assets do
          label "Imagens de Testemunhas"
          help "Adicione a imagem de cada testemunha: Primeiro dele e depois dela"
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
