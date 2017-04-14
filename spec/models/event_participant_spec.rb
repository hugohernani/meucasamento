require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  context 'validations' do
    [:event_role].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end

  context 'associations' do
    [:participant, :event].each do |attr|
      it { is_expected.to belong_to(attr) }
    end
  end
end
