class Event < ApplicationRecord
  include EventAdmin
  extend FriendlyId

  # callbacks
  # after_create :add_tenant_to_apartment
  # before_update :rename_schema
  # after_destroy :drop_tenant_from_apartment
  before_save :downcase_fields, :set_tenant_name

  SLUG_FORMAT = /([[:lower:]]|[0-9]+-?[[:lower:]])(-[[:lower:]0-9]+|[[:lower:]0-9])*/

  friendly_id :slug_candidates, use: :slugged

  enum event_type: { wedding: 0 }

  # Associations
  belongs_to :theme,                    class_name: Theme
  has_many :event_participants,         class_name: EventParticipant,
                                        source: :event,
                                        inverse_of: :event

  has_many :grooms,                     class_name: Account,
                                        through: :event_participants,
                                        source: :event
  has_many :event_images,               class_name: EventImage,
                                        source: :event,
                                        inverse_of: :event,
                                        dependent: :destroy,
                                        autosave: true

  has_one :top_slider,                  class_name: TopSlider,
                                        foreign_key: :event_id,
                                        inverse_of: :event,
                                        dependent: :destroy,
                                        required: true,
                                        autosave: true

  has_one :gallery,                     class_name: Gallery,
                                        inverse_of: :event,
                                        dependent: :destroy,
                                        required: true

  has_many :image_assets,               class_name: Asset,
                                        through: :event_images,
                                        source: :assets,
                                        inverse_of: :owner

  has_one :love_story,                  class_name: LoveStory,
                                        inverse_of: :event,
                                        dependent: :destroy,
                                        required: true,
                                        autosave: true
  has_one :fun_facts,                   class_name: FunFacts,
                                        inverse_of: :event,
                                        dependent: :destroy,
                                        required: true

  # Validations
  validates :name, :description, :celebration_date, :event_type, presence: true

  # Scopes
  scope :weddings, -> { where(event_type: Event.event_types[:wedding]) }

  # Delegations
  delegate :groom, :bride, to: :event_participants
  delegate :assets, to: :top_slider, prefix: true

  # Cocoon Setup
  accepts_nested_attributes_for :event_participants, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :grooms, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :event_images, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :top_slider, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :gallery, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :image_assets, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :love_story, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :fun_facts, reject_if: :all_blank, allow_destroy: true

  def to_s
    name
  end

  # Has One Associations Overriding
  def top_slider
    super || build_top_slider
  end

  def gallery
    super || build_gallery
  end

  def love_story
    super || build_love_story
  end

  def fun_facts
    super || build_fun_facts
  end

  # def self.current
  #   tenant = find_by(tenant_name: Apartment::Tenant.current)
  #   raise ::Apartment::TenantNotFound, "Instância de Tenant não encontrada" unless tenant
  #   tenant
  # end
  #
  # def switch!
  #   Apartment::Tenant.switch! (tenant_name != 'public' ? tenant_name : 'public')
  #   tenant_name
  # end
  #
  # def self.switch_to_default_tenant!
  #   Apartment::Tenant.reset
  #   Apartment::Tenant.seed # It feeds the tenant so that its scheme is Data Updated
  # end
  #
  # def self.default_public
  #   tenant = find_by(tenant_name: Apartment::Tenant.default_tenant)
  #   raise ::Apartment::TenantNotFound, "Não foi capaz de encontrar o Tenant padrão" unless tenant
  #   tenant
  # end
  #
  # def seed_tenant
  #   Apartment::Tenant.switch tenant_name do
  #     Apartment::Tenant.seed
  #   end
  # end

  private
  def slug_candidates
    [:name, [:id]]
  end

  # override friendly id validation message
  def validate_reserved
    if errors.has_key?(:friendly_id)
      errors.add(:slug, "está reservado. Por favor escolha outro")
      errors.messages.delete(:friendly_id)
    end
  end

  def set_tenant_name
    self.tenant_name = "#{name.parameterize.underscore}" if self.tenant_name.nil?
    self.tenant_name
  end

  # def add_tenant_to_apartment
  #   if !ActiveRecord::Base.connection.schema_names.include?(self.tenant_name) && self.tenant_name != 'public'
  #     Apartment::Tenant.create(self.tenant_name)
  #   end
  # end
  #
  # def rename_schema
  #   if self.tenant_name != 'public' && tenant_name_change && tenant_name_change.uniq.length > 1
  #     sql = "ALTER SCHEMA \"#{tenant_name_change.first}\" RENAME TO \"#{tenant_name_change.last}\";"
  #     ActiveRecord::Base.connection.execute(sql)
  #   end
  # end
  #
  # def drop_tenant_from_apartment
  #   Apartment::Tenant.drop(set_tenant_name)
  # end

  def downcase_fields
    self.tenant_name = self.tenant_name.downcase if self.tenant_name
  end
end
