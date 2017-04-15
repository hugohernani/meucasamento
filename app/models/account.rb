class Account < ApplicationRecord
  rolify strict: true
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

  def to_s
    social_name
  end
end
