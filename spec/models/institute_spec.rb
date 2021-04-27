require 'rails_helper'

RSpec.describe Institute, type: :model do
  subject { institute }

  context 'when all fields contain valid values' do
    let(:institute) { build(:institute,
      name: 'Absolutely Awesome Academy') }
    
    it { is_expected.to be_valid }
  end

  describe 'validations' do
    let(:institute) { build(:institute) }

    it { is_expected.to validate_presence_of(:name) }
  end
end
