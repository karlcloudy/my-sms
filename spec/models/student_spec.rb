require 'rails_helper'

RSpec.describe Student, :type => :model do
    it 'returns title; first, middle, and last names when requesting full_name' do
        student = create(:student)
        expect(student.full_name).to eq("#{student.title} #{student.first_name} #{student.middle_name} #{student.last_name}")
    end
end