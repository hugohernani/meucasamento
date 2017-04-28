class Donation < ApplicationRecord
  has_many :orders, class_name: Order, inverse_of: :donation, dependent: :nullify
  belongs_to :wedding_list, class_name: WeddingList, inverse_of: :donations, required: true

  accepts_nested_attributes_for :orders, reject_if: :all_blank, allow_destroy: true
end
