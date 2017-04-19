class FunFacts < ApplicationRecord
  include FunFactsAdmin
  # Associations
  belongs_to :event,                    class_name: Event,
                                        inverse_of: :fun_facts
  has_one :assets,                      class_name: Asset,
                                        as: :owner,
                                        inverse_of: :owner

  alias_attribute :background_image, :assets

  # Validations
  validates :invited_people_count, :involved_people_count,
            :worked_hours, :cups_of_coffee_count, presence: true

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  def assets
    super || build_assets
  end

  def background_image
    assets || build_assets
  end
end
