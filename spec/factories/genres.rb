FactoryBot.define do
	factory :genre do
		sequence (:genre_name) { |n| "test#{n}"}
		sequence (:is_valid) { |n| "true"}

		trait :no_genre_name do
			genre_name {}
		end
	end
end