FactoryBot.define do
	factory :topick do
		sequence(:topick_name) {|n| "title#{n}"}
		sequence(:introduction) {|n| "intro#{n}"}
		sequence(:topick_status) {|n| "i#{n}"}
		sequence(:impressions_count){|n| "#{n}"}

		trait :no_topick_name do
			topick_name {}
		end
		trait :no_introduction do
			introduction {}
		end
	end
end

	# t.string "topick_name"
 #    t.text "introduction"
 #    t.string "topick_status"
 #    t.integer "genre_id"
