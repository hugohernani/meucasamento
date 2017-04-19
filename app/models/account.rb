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
  has_many   :my_witnesses,                 class_name: WeddingWitnessCouple,
                                            foreign_key: 'fiance_id',
                                            inverse_of: :fiance

  has_one :about_us,                        class_name: FianceAbout,
                                            foreign_key: 'fiance_id',
                                            inverse_of: :fiance

  # Coccon Setup
  accepts_nested_attributes_for :about_us, reject_if: :all_blank, allow_destroy: true

  def to_s
    social_name
  end

  def about_us
    super || build_about_us(content: 'Por favor, altere sua descrição')
  end
end
