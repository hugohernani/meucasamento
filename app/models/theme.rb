class Theme < ApplicationRecord
  # Validations
  validates :name, :layout_name, presence: true

  # Associations
  has_many :events, class_name: Event

  def self.default
    @default_theme ||= find_or_initialize_by(layout_name: 'default')
    @default_theme.name = "Default"
    @default_theme.save if @default_theme.changed?
  end
end
