class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :email, presence: true

  has_many :event_participants,             class_name: EventParticipant,
                                            source: :participant

  has_many :events,                         class_name: Event,
                                            through: :event_participants
end
