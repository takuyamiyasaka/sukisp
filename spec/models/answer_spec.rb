require "rails_helper"

RSpec.describe Answer, type: :model do
	describe "アソシエーション" do
		it "inquiryモデルに属している" do
			is_expected.to belong_to(:inquiry)
		end
	end
	describe "保存のテスト" do
		it "正しく保存される" do
			inquiry = create(:inquiry)
			expect(Factorybot.create(:answer,answer_id: inquiry.id)).to be_valid
		end
		it "正しく保存されない" do
			expect(Factorybot.build(:answer, :no_answer)).to_not be_valid
		end
	end
end