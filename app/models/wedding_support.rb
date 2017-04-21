class WeddingSupport < ApplicationRecord
  include WeddingSupportAdmin

  # Associations
  belongs_to :event, class_name: Event, inverse_of: :wedding_support, required: true

  # Validations
  validates :message, presence: true
end
