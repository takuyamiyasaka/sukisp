FactoryBot.define do
	# password = Faker::Internet.password

	factory :customer do
		sequence(:name) { |n| "test_name#{n}"}
		sequence(:public_name) {|n| "testp_name#{n}"}
		sequence(:email) {|n| "test#{n}@com"}
		password{ password }
		password_confirmation { password }

    # after(:create) do |customer|
    #   create_list(:topick, 2, customer: customer)
    # end

    trait :no_name do
      name {}
    end

    trait :no_public_name do
      public_name {}
    end

     trait :create_with_topics do
       after(:create) do |customer|
         create_list(:topick, 3, customer: customer)
       end
     end
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