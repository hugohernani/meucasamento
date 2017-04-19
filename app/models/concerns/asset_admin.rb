module AssetAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :owner
        field :attachment, :paperclip do
          label "Image"
        end
      end
    end
  end
end
