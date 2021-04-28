FactoryBot.define do
  factory :course do
    association :institute
    name { Faker::Educator.unique.course_name }
    description { [nil, '', Faker::Lorem.paragraph(sentence_count: 5)].sample }
    number_of_semesters { Faker::Number.within(range: 1..4) }
    allocation { [nil, Faker::Number.within(range: 1..100)].sample }
    start_date { Faker::Date.backward(days: 180) }
    end_date { Faker::Date.forward(days: 180) }
  end
end
