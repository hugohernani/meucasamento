class WeddingWitnessCouple < ApplicationRecord
  include WeddingWitnessCoupleAdmin
  belongs_to :fiance,   class_name: Account, inverse_of: :my_witnesses, required: true
  has_many :assets,     class_name: Asset, as: :owner, inverse_of: :owner

  alias_attribute :profile_images, :assets

  validates :male_name, :male_description, :female_name, :female_description, presence: true
  validates :assets, length: { minimum: 2, maximum: 2 }

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  def male_image
    profile_images.first
  end

  def female_image
    profile_images.second
  end
end
