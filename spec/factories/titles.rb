FactoryBot.define do
  factory :title do
    title { %w[Miss Mrs Ms Mr Dr].sample }
  end
end
