FactoryBot.define do

  factory :message do
    sequence(:content) {|n| "text#{n}"}

    trait :no_content do
    	content {}
    end
  end
end
