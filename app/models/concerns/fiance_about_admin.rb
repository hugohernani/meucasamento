module FianceAboutAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :assets do
          label "Profile Image"
          help false
          active true
        end
      end
    end
  end
end
