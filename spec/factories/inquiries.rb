FactoryBot.define do

	factory :inquiry do
		sequence(:request) {|n| "test#{n}"}
		sequence(:unsolved) {true}
		sequence(:is_receive) {true}

		trait :no_request do
			request {}
		end
	end
end