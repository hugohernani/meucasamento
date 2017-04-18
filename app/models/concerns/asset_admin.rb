module AssetAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :owner
        field :file, :paperclip
      end
    end
  end
end
