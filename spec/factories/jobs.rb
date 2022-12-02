FactoryBot.define do
  factory :job do
    client
    plumbers { rand(3).times { create(:plumber) } }
    start_on { Time.current }
  end
end
