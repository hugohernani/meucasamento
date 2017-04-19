module FunFactsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :assets do
          label "Background Image"
          help false
          active true
        end
      end
    end
  end
end
