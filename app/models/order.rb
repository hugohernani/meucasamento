class Order < ApplicationRecord
  belongs_to :donation, class_name: Donation, inverse_of: :orders, required: true
end
