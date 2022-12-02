FactoryBot.define do
  factory :job do
    client
    plumbers { [create(:plumber)] }
    start_on { Time.current }
  end
end
