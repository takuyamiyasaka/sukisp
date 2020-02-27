FactoryBot.define do
	password = Faker::Internet.password

	factory :customer do
		sequence(:name) { |n| "name#{n}"}
		sequence(:public_name) { |n|} "nick_name#{n}"}
		sequence(:email) {|n| "hoge#{n}@test.com"}
		sequence(:self_introduction) {|n| "self_intro#{n}"}
		password {password}
		password_confirmation {password}
	end
end






		# t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.string "name"
  #   t.string "public_name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "profile_image_id"
  #   t.datetime "deleted_at"
  #   t.text "self_introduction"