require "rails_helper"

RSpec.describe Answer, type: :model do
	describe "アソシエーション" do
		it "inquiryモデルに属している" do
			is_expected.to belong_to(:inquiry)
		end
	end
	describe "保存のテスト" do
		it "正しく保存される" do
			customer = create(:customer)
			inquiry = FactoryBot.create(:inquiry, customer_id: customer.id)
			expect(FactoryBot.create(:answer,inquiry_id: inquiry.id)).to be_valid
		end
		it "正しく保存されない" do
			expect(FactoryBot.build(:answer, :no_answer)).to_not be_valid
		end
	end
end