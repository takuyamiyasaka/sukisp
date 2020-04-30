FactoryBot.define do
	password = Faker::Internet.password

	factory :customer do
		sequence(:name) { |n| "test_name#{n}"}
		sequence(:public_name) {|n| "testp_name#{n}"}
		sequence(:email) {|n| "test#{n}@com"}
		password{ password }
		password_confirmation { password }


    trait :no_name do
      name {}
    end

    trait :no_public_name do
      public_name {}
    end

    trait :profile_image do
      profile_image_id {Rack::Test::UploaderFile.new(File.join(Rails.root,"img/airport.jpg"),"imge/jpg")}
    end

     trait :create_with_topicks do
       after(:create) do |customer|
         create_list(:topick, 3, customer: customer, genre: genre)
       end
     end
	end
end