FactoryBot.define do
	factory :topick do
		sequence(:topick_name) {|n| "title#{n}"}
		sequence(:introduction) {|n| "intro#{n}"}
	end
end

	# t.string "topick_name"
 #    t.text "introduction"
 #    t.string "topick_status"
 #    t.integer "genre_id"
