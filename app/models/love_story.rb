class LoveStory < ApplicationRecord
  include LoveStoryAdmin
  belongs_to :event,        class_name: Event, inverse_of: :love_story
  has_many   :assets,       class_name: Asset, as: :owner, inverse_of: :owner

  # Validations
  validates :we_met, :first_date, :engagement, presence: true
  validates :assets, length: { minimum: 3, maximum: 3 }

  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  alias_method :old_assets, :assets

  def assets
    (old_assets.size..2).each{ |i| old_assets.build unless old_assets[i].try(:id?) }
    old_assets
  end

  def we_met_image
    assets.first
  end

  def first_date_image
    assets.second
  end

  def engagement_image
    assets.third
  end
end
