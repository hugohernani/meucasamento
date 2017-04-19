class TopSlider < EventImage
  include EventImageAdmin, TopSliderAdmin
  belongs_to :event, class_name: Event, foreign_key: :event_id, inverse_of: :top_slider, required: true

  # Validations
  validates :assets, length: { minimum: 2, maximum: 5 }

  alias_method :old_assets, :assets

  def assets
    (old_assets.count..4).each{ |i| old_assets.build unless old_assets[i].try(:id?) }
    old_assets
  end

end
