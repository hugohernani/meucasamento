class Role < ApplicationRecord
  has_many :account_roles, join_table: :accounts_roles, class_name: AccountRole
  has_many :accounts, through: :account_roles, source: :account

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def to_s
    name.titleize
  end

  def self.default_roles
    [:super_admin, :admin, :fiance, :owner]
  end
end
