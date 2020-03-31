require 'rails_helper'

RSpec.describe Message, "モデルに関するテスト",type: :model do
	describe "アソシエーション" do
		it "customerモデルに属している" do
			is_expected.to belong_to(:customer)
		end
		it "roomモデルに属している" do
			is_expected.to belong_to(:room)
		end
	end

	describe "保存のテスト" do
		before do
			@customer = create(:customer)
			@room = create(:room)
		end
		it "正しく保存される" do
			expect(FactoryBot.build(:message,customer_id:@customer.id,room_id:@room.id)).to be_valid
		end

		it "正しく保存されない" do
			expect(FactoryBot.build(:message, :no_content,customer_id:@customer_id,room_id:@room.id)).to_not be_valid
		end
	end
end
