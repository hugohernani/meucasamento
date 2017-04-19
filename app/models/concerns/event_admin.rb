module EventAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        exclude_fields :event_images, :image_assets
        configure :event_participants do
          visible(false)
        end
        configure :top_slider do
          label "Top Slider"
          help false
          active true
        end
        configure :gallery do
          help false
          active true
        end
        configure :love_story do
          active true
          help false
        end
        configure :fun_facts do
          help false
          active true
        end
        # configure :event_images do
        #   label "Images"
        #   orderable(:res_type)
        #   inline_add do
        #     EventImage.where(event_id: bindings[:object].id).count < 5
        #   end
        #   help false
        # end
        # configure :image_assets do
        #   label "Attached Images"
        #   visible do
        #    EventImage.where(event_id: bindings[:object].id).count >= 5
        #   end
        #   read_only true
        # end
      end
    end
  end
end
