class Donation < ApplicationRecord
  include DonationAdmin
  has_many :orders, class_name: Order, inverse_of: :donation, dependent: :nullify
  belongs_to :wedding_list, class_name: WeddingList, inverse_of: :donations, required: true
  belongs_to :product, class_name: Product

  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true

  default_scope ->(){ order(:price) }
  scope :as_product, ->(){ where.not(product_id: nil) }
  scope :not_as_product, ->(){ where(product_id: nil) }
end
