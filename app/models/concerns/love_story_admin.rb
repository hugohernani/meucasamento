module LoveStoryAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :assets do
          label "Images"
          help false
          active true
          inline_add do
            love_story_instance = bindings[:object]
            Asset.where(owner: love_story_instance).count < 3
          end
        end
      end
    end
  end
end
