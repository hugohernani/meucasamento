class FianceAbout < ApplicationRecord
  belongs_to :fiance,                   class_name: Account,
                                        foreign_key: 'fiance_id',
                                        inverse_of: :about_us

  validates :content, presence: true

  def to_s
    content.split.first(5).join(' ') + '...'
  end
end
