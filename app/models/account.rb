class Account < ApplicationRecord
  rolify strict: true
  include AccountAdmin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :email, presence: true

  has_many :event_participants,             class_name: EventParticipant,
                                            foreign_key: :participant_id

  has_many :events,                         class_name: Event,
                                            through: :event_participants,
                                            source: :participant

  has_one :about_us,                        class_name: FianceAbout,
                                            foreign_key: 'fiance_id',
                                            inverse_of: :fiance

  # Coccon Setup
  accepts_nested_attributes_for :about_us, reject_if: :all_blank, allow_destroy: true

  def to_s
    social_name
  end
end
