require "rails_helper"

RSpec.describe Relationship ,"モデルに関するテスト" ,type: :model do
	describe "アソシエーションのテスト" do
		it "customerモデルに属している" do
			is_expected.to belong_to(:customer)
		end
		it "followモデルに属している" do
			is_expected.to belong_to(:follow)
		end
	end
end