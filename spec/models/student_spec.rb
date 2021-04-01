require 'rails_helper'

RSpec.describe Student, type: :model do
    describe '#full_name' do
        subject { student.full_name }
        context 'all fields contain values' do
            let(:student) { create(:student, title: "Mr", first_name: "Henry", middle_name: "Johnathon", last_name: "Ford", birth_date: "19010710", gender: "M") }
            
            it 'returns the full name' do
                expect(subject).to eq("Mr Henry Johnathon Ford")
            end
        end

        context 'first_name and middle_name are missing' do
            let(:student) { create(:student, title: "Mr", first_name: nil, middle_name: nil, last_name: "Ford", birth_date: "19010710", gender: "M") }
            
            it 'returns the full name, without unexpected spaces' do
                expect(subject).to eq("Mr Ford")
            end
        end
    end
end