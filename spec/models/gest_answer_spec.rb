require 'rails_helper'

RSpec.describe GestAnswer,"モデルのテスト", type: :model do
	describe "アソシエーション" do
		it "gest_inquiryモデルに属している" do
			is_expected.to belong_to(:gest_inquiry)
		end
	end
	describe "保存のテスト" do
		it "正しく保存される" do
			gest_inquiry = create(:gest_inquiry)
			expect(FactoryBot.build(:gest_answer,gest_inquiry_id: gest_inquiry.id)).to be_valid
		end
		it "正しく保存されない" do
			gest_inquiry = create(:gest_inquiry)
			expect(FactoryBot.build(:gest_answer,:no_gest_answer,gest_inquiry_id:gest_inquiry.id)).to_not be_valid
		end
	end
end
