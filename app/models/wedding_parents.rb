class WeddingParents < ApplicationRecord
  include WeddingParentsAdmin
  belongs_to :fiance,   class_name: Account, inverse_of: :my_parents, required: true
  has_many :assets,     class_name: Asset, as: :owner, inverse_of: :owner

  validates :father_name, :father_description, :mother_name, :mother_description, presence: true
  validates :assets, length: { minimum: 2, maximum: 2 }

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  alias_method :old_assets, :assets
  alias_attribute :profile_images, :assets

  def assets
    (old_assets.size..1).each{ |i| old_assets.build unless old_assets[i].try(:id?) }
    old_assets
  end

  def father_image
    assets.first
  end

  def mother_image
    assets.second
  end
end
