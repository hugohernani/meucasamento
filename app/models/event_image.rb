class EventImage < ApplicationRecord
  include EventImageAdmin
  belongs_to :event, class_name: Event, foreign_key: :event_id, inverse_of: :event_images
  has_many :assets, as: :owner, inverse_of: :owner

  enum res_type: { homepage_slider: 0 }

  # Coccon Setup
  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true
end
