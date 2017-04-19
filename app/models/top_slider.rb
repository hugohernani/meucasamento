class TopSlider < EventImage
  include EventImageAdmin, TopSliderAdmin
  belongs_to :event, class_name: Event, foreign_key: :event_id, inverse_of: :top_slider, required: true

  # Validations
  validates :assets, length: { minimum: 1, maximum: 5 }
end
