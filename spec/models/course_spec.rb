require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { course }
  context 'when all fields contain valid values' do
    let(:course) { build(:course,
      name: 'Intro to Valid Course Names 101',
      description: 'A fabulous course that everybody should do.',
      number_of_semesters: 2,
      start_date: Date.new(2020, 1, 1),
      end_date: Date.new(2020, 12, 31),
      allocation: 98) }
    
    it { is_expected.to be_valid }

    it 'allows a blank description' do
      subject.description = ''

      expect(subject).to be_valid
    end

    it 'allows no student allocation' do
      subject.allocation = nil

      expect(subject).to be_valid
    end
  end
  context 'when fields have invalid values' do
    let(:course) { build(:course) }

    it 'has an error for a blank name' do
      subject.name = ''

      subject.valid?

      expect(subject.errors[:name].count).to be > 0
    end

    it 'has an error for a negative number of semesters' do
      subject.number_of_semesters = -1

      subject.valid?

      expect(subject.errors[:number_of_semesters].count).to be > 0
    end

    it 'has an error when there is no start date' do
      subject.start_date = nil

      subject.valid?

      expect(subject.errors[:start_date].count).to be > 0
    end
    
    it 'has an error when there is no end date' do
      subject.end_date = nil

      subject.valid?

      expect(subject.errors[:end_date].count).to be > 0
    end

    it 'has an error for a negative student allocation' do
      subject.allocation = -1

      subject.valid?

      expect(subject.errors[:allocation].count).to be > 0
    end
  end
end
