FactoryBot.define do
  factory :message do
    customer { nil }
    room { nil }
    content { "MyText" }
  end
end
