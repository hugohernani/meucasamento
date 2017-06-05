class DonationForm
  include ActiveModel::Model

  attr_accessor :card_token, :sender_hash, :session_id, :name, :email, :cpf,
                :phone_code, :phone_number, :birthday, :card_name, :card_number,
                :card_month, :card_year, :card_cvv, :card_options, :payment_errors,
                :donation_id, :card_flag, :card_installment_value

  validates :name, :email, :cpf, :card_number,
            :card_month, :card_year, presence: true
end
