require 'rails_helper'

RSpec.describe GestInquiry,"モデルに関するテスト", type: :model do

	describe "アソシエーションのテスト" do
		it "gest_answerモデルを持っている" do
			is_expected.to have_one(:gest_answer)
		end
	end
	before do
		@gest_inquiry = build(:gest_inquiry)
	end

	describe "保存のテスト" do
		it "正しく保存" do
			expect(@gest_inquiry).to be_valid
		end
		it "正しく保存されない" do
			expect(FactoryBot.build(:gest_inquiry,:no_gest_request)).to_not be_valid
		end
	end
end
