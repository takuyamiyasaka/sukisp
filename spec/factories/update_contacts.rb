FactoryBot.define do
	factory :update_contact do
		sequence(:contact) {|n| "test#{n}"}

		trait :no_contact do
		contact {}
		end
	end
end