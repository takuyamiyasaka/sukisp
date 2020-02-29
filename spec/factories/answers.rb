FactoryBot.define do

	factory :answer do
		sequence(:answer) {|n| "test#{n}"}

		trait :no_answer do
			answer {}
		end
	end
end