FactoryBot.define do
  factory :gest_inquiry do
    sequence(:gest_name) {|n| "test_name#{n}" }
    sequence(:gest_email) {|n| "test_email@#{n}.com" }
    gest_request { "test" }
    unsolved { true }

    trait :no_gest_request do
    	gest_request {}
    end
  end
end
