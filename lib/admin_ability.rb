# See https://github.com/sferik/rails_admin/wiki/CanCanCan

# in models/admin_ability.rb
class AdminAbility
  include CanCan::Ability
  def initialize(account)
    alias_action :new, :destroy, to: :create_destroy
    alias_action :index, :export, :history, :new, :destroy, to: :admin_actions
    alias_action :index, :export, :history, to: :see

    can :read, :all

    main_models = [Event, EventParticipant, Theme, Account]

    account_roles = account.roles.map(&:name)
    if account_roles.any?
      can :access, :rails_admin
      can :dashboard
      if account_roles.include? "super_admin"
        can :manage, :all
      end
    end
  end
end
