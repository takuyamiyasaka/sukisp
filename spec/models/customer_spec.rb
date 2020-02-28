require "rails_helper"

RSpec.describe Customer, "モデルに関するテスト",type: :model do
	describe "アソシエーション" do
		it "Topickモデルを多数持っている" do
			is_expected.to have_many(:topicks)
		end
		it "Inquiryモデルを多数持っている" do
			is_expected.to have_many(:inquiries)
		end
		it "Commentモデルを多数持っている" do
			is_expected.to have_many(:comments)
		end
		it "Likeモデルを多数持っている" do
			is_expected.to have_many(:likes)
		end
	end
	before do
		@customer = build(:customer)
	end
	describe "customerモデルが正しく保存される" do
		it "正常に保存される" do
			expect(@customer).to be_valid
		end
	end
	describe "customerモデルが正しく保存されない" do
		it "nameが空" do
			expect(FactoryBot.build(:customer, :no_name)).to_not be_valid
		end
		it "public_nameが空" do
			expect(FactoryBot.build(:customer, :no_public_name)).to_not be_valid
		end
	end
end