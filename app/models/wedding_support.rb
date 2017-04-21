class WeddingSupport < ApplicationRecord
  include WeddingSupportAdmin

  # Associations
  belongs_to :event, class_name: Event, inverse_of: :wedding_support, required: true
  has_many :bank_accounts, class_name: BankAccount, inverse_of: :wedding_support

  # Validations
  validates :message, presence: true

  alias_method :old_bank_accounts, :bank_accounts

  def bank_accounts
    (old_bank_accounts.size..1).each{ |i| old_bank_accounts.build(dump_bank_hash) unless old_bank_accounts[i].try(:id?) }
    old_bank_accounts
  end

  private
  def dump_bank_hash
    {
      name: "Nome do Titular",
      bank: "Nome do Banco",
      agency: "XXXX-X",
      account: "XXXXX-X"
    }
  end
end
