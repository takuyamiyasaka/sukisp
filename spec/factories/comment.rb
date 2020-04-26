FactoryBot.define do
	factory :comment do
		sequence(:comment) {|n| "test_comment#{n}"}


		trait :no_comment do
			comment {}
		end
	end
end