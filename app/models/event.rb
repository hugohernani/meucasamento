class Event < ApplicationRecord
  extend FriendlyId

  SLUG_FORMAT = /([[:lower:]]|[0-9]+-?[[:lower:]])(-[[:lower:]0-9]+|[[:lower:]0-9])*/

  friendly_id :slug_candidates, use: :slugged

  validates :name, :description, :celebration_date, :event_type, presence: true

  enum event_type: { wedding: 0 }

  private
  # Slug setup
  def slug_candidates
    [:name, [:id]
  end

  # override friendly id validation message
  def validate_reserved
    if errors.has_key?(:friendly_id)
      errors.add(:slug, "está reservado. Por favor escolha outro")
      errors.messages.delete(:friendly_id)
    end
  end
end
