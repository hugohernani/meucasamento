class EventImage < ApplicationRecord
  belongs_to :event, class_name: Event, foreign_key: :event_id, inverse_of: :event_images, required: true
  has_many :assets,       ->{ order(position: :asc, capture: :asc) },
                          as: :owner, inverse_of: :owner

  # Validations
  # validates :assets, length: { minimum: 1 }

  # Coccon Setup
  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true
end
