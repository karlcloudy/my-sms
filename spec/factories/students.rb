FactoryBot.define do
    factory :student do
        #Generate student information via Faker.
        title { Faker::Name.prefix }
        first_name { Faker::Name.first_name }
        middle_name { Faker::Name.middle_name }
        last_name { Faker::Name.last_name }
        gender { Faker::Gender.binary_type[0] } #short_binary_type seems unavailable in my version, so I took the first character of binary_type instead
        birth_date { Faker::Date.birthday(min_age: 13, max_age: 100) }
        email { Faker::Internet.safe_email }
    end
end