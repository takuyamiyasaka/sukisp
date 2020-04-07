FactoryBot.define do
  factory :gest_answer do
    gest_answer { "gest_test" }

    trait :no_gest_answer do
    	gest_answer {}
    end
  end
end
