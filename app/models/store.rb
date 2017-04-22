class Store < ApplicationRecord
  include StoreAdmin
  belongs_to :wedding_list, class_name: WeddingList, inverse_of: :stores, required: true
  has_many :products, class_name: Product, inverse_of: :store, autosave: true, dependent: :destroy
  has_one :assets, class_name: Asset, as: :owner, inverse_of: :owner, dependent: :destroy

  alias_attribute :image, :assets

  delegate :attachment, to: :image

  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  def assets
    super || build_assets
  end

  def image
    assets || build_assets
  end
end
