require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    [:name, :description, :celebration_date, :event_type].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end

  # context 'associations' do
    # [].each do |attr|
    #   it { is_expected.to belong_to(attr) }
    # end
  # end
end
