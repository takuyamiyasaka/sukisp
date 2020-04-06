FactoryBot.define do
  factory :gest_inquiry do
    gest_name { "MyString" }
    gest_email { "MyString" }
    gest_request { "MyText" }
    unsolved { false }
  end
end
