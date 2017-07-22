# See https://github.com/sferik/rails_admin/wiki/CanCanCan

# in models/admin_ability.rb
class AdminAbility
  include CanCan::Ability

  def initialize(account)
    alias_action :new, :destroy, to: :create_destroy
    alias_action :index, :export, :history, :new, :destroy, to: :admin_actions
    alias_action :index, :export, :history, to: :see

    can :read, :all

    main_models = ApplicationRecord.descendants.map(&:name)

    account_roles = account.roles.map(&:name)
    if account_roles.any?
      can :access, :rails_admin
      can :dashboard
      if account_roles.include? "super_admin"
        can :manage, :all
      elsif account_roles.include? "fiance"
        cannot :manage, main_models
        cannot :read, :all
        can [:index, :edit], Event, event_participants: { participant_id: account.id }
        can [:index, :edit, :new, :destroy], WeddingWitnessCouple, fiance_id: account.id
        can [:index, :edit], FianceAbout, fiance_id: account.id
        can [:index, :edit], LoveStory, event: { event_participants: { participant_id: account.id } }
        can [:index, :edit], Gallery, event_id: current_event.try(:id)
      end
    end
  end

  def current_event
    @current_event ||= ENV['tenant_name'].present?? Event.find_by(tenant_name: ENV['tenant_name']) : nil
  end
end
