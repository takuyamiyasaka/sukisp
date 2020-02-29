require "rails_helper"
 RSpec.describe Inquiry, "モデルに関するテスト", type: :model do
 	describe "アソシエーション" do
 		it "customerモデルに属している" do
 			is_expected.to belong_to(:customer)
 		end
 		it "answerモデルを持っている" do
 			is_expected.to have_one(:answer)
 		end
 	end
 	before do
 		@inquiry = build(:inquiry)
 	end
 	describe "保存のテスト" do
 		context "正しく保存される" do
 			it "有効なものを入れて保存" do
 				customer = create(:customer)
 				expect(FactoryBot.create(:inquiry, customer_id: customer.id)).to be_valid
	 		end
	 	end
 		context "正しく保存されない" do
	 		it "requestが空" do
	 			expect(FactoryBot.build(:inquiry ,:no_request)).to_not be_valid
	 		end
	 	end
 	end
 end