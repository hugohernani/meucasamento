class EventImage < ApplicationRecord
  belongs_to :event, class_name: Event, foreign_key: :event_id, inverse_of: :event_images
  has_many :assets, as: :owner

  enum res_type: { homepage_slider: 0 }
end
