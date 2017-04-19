class FianceAbout < ApplicationRecord
  include FianceAboutAdmin
  belongs_to :fiance,                   class_name: Account,
                                        foreign_key: 'fiance_id',
                                        inverse_of: :about_us,
                                        required: true

  has_one :assets,                      class_name: Asset,
                                        as: :owner,
                                        inverse_of: :owner,
                                        required: true

  alias_attribute :asset, :assets

  validates :content, presence: true

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  def to_s
    content.split.first(5).join(' ') + '...'
  end
end
