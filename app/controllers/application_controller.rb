class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :try_setting_current_event_at_rails_admin

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def try_setting_current_event_at_rails_admin
    unless ENV['tenant_name']
      req_subdomain = request.subdomain || ''
      ENV['tenant_name'] = (req_subdomain.present? && req_subdomain != 'www') ? req_subdomain : nil
    end
  end
end
