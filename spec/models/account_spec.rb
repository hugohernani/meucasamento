require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'validations' do
    [:email].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
end
