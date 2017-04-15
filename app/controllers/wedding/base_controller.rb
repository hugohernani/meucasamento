module Wedding
  class BaseController < ApplicationController
    layout :load_theme
    before_action :current_event

    private
    def load_theme
      theme_name = current_event.try(:theme).present?? current_event.theme.name : ''
      if template_exists?((theme_name.present?? theme_name : 'default'), 'layout_themes')
        "themes/#{theme_name}"
      else
        'themes/default'
      end
    end

    def current_event
      @current_event ||= Event.find_by(tenant_name: request.subdomain)
      set_dependencies
    end

    def set_dependencies
      @current_event.theme ||= Theme.default
      @current_event.save if @current_event.changed?
    end
  end
end
