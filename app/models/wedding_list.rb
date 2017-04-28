class WeddingList < ApplicationRecord
  include WeddingListAdmin
  # Associations
  belongs_to :wedding_support,                      class_name: WeddingSupport,
                                                    inverse_of: :wedding_list,
                                                    required: true
  has_many :stores,                                 class_name: Store,
                                                    inverse_of: :wedding_list,
                                                    autosave: true,
                                                    dependent: :destroy
  has_many :products,                               class_name: Product,
                                                    through: :stores

  has_many :donations,                              class_name: Donation,
                                                    inverse_of: :wedding_list


  accepts_nested_attributes_for :stores, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :donations, reject_if: :all_blank, allow_destroy: true

  def to_s
    id.to_s
  end
end
