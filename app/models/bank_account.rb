class BankAccount < ApplicationRecord
  include BankAccountAdmin

  # Associations
  belongs_to :wedding_support, class_name: WeddingSupport, inverse_of: :bank_accounts, required: true

  # Validations
  validates :name, :bank, :agency, :account, presence: true
end
