class Theme < ApplicationRecord
  # Validations
  validates :name, :layout_name, presence: true

  # Associations
  has_many :events, class_name: Event

  def self.default
    @default_theme ||= find_or_create_by(name: 'Default', layout_name: 'default')
  end
end
