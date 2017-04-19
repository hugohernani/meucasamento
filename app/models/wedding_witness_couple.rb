class WeddingWitnessCouple < ApplicationRecord
  include WeddingWitnessCoupleAdmin
  belongs_to :fiance,   class_name: Account, inverse_of: :my_witnesses, required: true
  has_many :assets,     class_name: Asset, as: :owner, inverse_of: :owner

  validates :male_name, :male_description, :female_name, :female_description, presence: true
  validates :assets, length: { minimum: 2, maximum: 2 }

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  alias_method :old_assets, :assets
  alias_attribute :profile_images, :assets

  def assets
    (old_assets.size..1).each{ |i| old_assets.build unless old_assets[i].try(:id?) }
    old_assets
  end

  def male_image
    assets.first
  end

  def female_image
    assets.second
  end
end
