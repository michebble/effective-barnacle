FactoryBot.define do
  factory :client do
    name { Faker::Name.unique.name }
    age { rand(18..65) }
    private_note { Faker::Quote.matz }
  end
end
