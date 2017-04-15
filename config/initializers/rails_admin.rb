# require 'i18n'
# I18n.default_locale = :de

RailsAdmin.config do |config|
  config.main_app_name = ["Meu Casamento", "Administração"]

  ### == Global Model Definitions ==
  # Event Related
  config.model "Event" do
    navigation_label "Event Related"
  end
  config.model "EventParticipant" do
    parent Event
  end

  # Account Related
  config.model "Account" do
  end

  config.label_methods << :to_s

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :account
  end
  config.current_user_method(&:current_account)

  ## == Cancan ==
  config.authorize_with :cancan, AdminAbility

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    bulk_delete
    # member actions
    show
    edit
    delete
    show_in_app

    # Charts
    # charts

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.parent_controller = '::ApplicationController'
end
