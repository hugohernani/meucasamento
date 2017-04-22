class WeddingSupport < ApplicationRecord
  include WeddingSupportAdmin

  # Associations
  belongs_to :event, class_name: Event, inverse_of: :wedding_support, required: true
  has_one :wedding_list, class_name: WeddingList, inverse_of: :wedding_support, dependent: :destroy
  has_many :bank_accounts, class_name: BankAccount, inverse_of: :wedding_support, dependent: :destroy
  has_many :stores, class_name: Store, through: :wedding_list
  has_many :products, class_name: Product, through: :stores

  # Validations
  validates :message, presence: true

  accepts_nested_attributes_for :wedding_list, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :bank_accounts, reject_if: :all_blank, allow_destroy: true

  def wedding_list
    super || create_wedding_list
  end

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
