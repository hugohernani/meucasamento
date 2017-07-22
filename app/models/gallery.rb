class Gallery < EventImage
  include EventImageAdmin, GalleryAdmin
  belongs_to :event, class_name: Event, foreign_key: :event_id, inverse_of: :gallery, required: true

  # Validations
  # validates :assets, length: { maximum: 20 }

  def to_s
    event.to_s
  end
end
