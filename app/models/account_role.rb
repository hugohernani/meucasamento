class AccountRole < ApplicationRecord
  include AccountRoleAdmin
  self.table_name = "accounts_roles"
  belongs_to :account
  belongs_to :role

  validates :account, :role, presence: true

  def to_s
    "#{account.to_s} | #{role.name}"
  end
end
