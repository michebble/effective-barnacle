FactoryBot.define do
  factory :plumber do
    name { Faker::Name.unique.name }
  end
end
