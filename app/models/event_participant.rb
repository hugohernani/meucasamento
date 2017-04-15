class EventParticipant < ApplicationRecord
  belongs_to :event, class_name: Event, foreign_key: 'event_id'
  belongs_to :participant, class_name: Account, foreign_key: 'participant_id'

  validates :event_role, presence: true

  enum event_role: { as_groom: 0, as_bride: 1 }

  def self.groom
    find_by(event_role: EventParticipant.event_roles[:as_groom]).try(:participant)
  end

  def self.bride
    find_by(event_role: EventParticipant.event_roles[:as_bride]).try(:participant)
  end
end
