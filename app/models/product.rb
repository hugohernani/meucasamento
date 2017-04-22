class Product < ApplicationRecord
  include ProductAdmin
  belongs_to :store, class_name: Store, inverse_of: :products, required: true
  has_one :assets, class_name: Asset, inverse_of: :owner, as: :owner, dependent: :destroy

  alias_attribute :image, :assets

  delegate :attachment, to: :image

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  def assets
    super || build_assets
  end

  def image
    assets || build_assets
  end
end
