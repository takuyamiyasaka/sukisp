require "rails_helper"
RSpec.describe Comment, "コメントモデルのテスト", type: :model do
	describe "アソシエーションのテスト" do
		it "customerモデルに帰属" do
			is_expected.to belong_to(:customer)
		end
		it "topickモデルに帰属" do
			is_expected.to belong_to(:topick)
		end
	end
	before do
		@customer = create(:customer)
			genre = create(:genre)
			@topick = FactoryBot.create(:topick, customer_id: @customer.id,genre_id: genre.id)
	end
	describe "保存のテスト" do
		it "正しく保存される" do
			expect(FactoryBot.create(:comment, customer_id: @customer.id,topick_id: @topick.id)).to be_valid
		end

		it "正しく保存されないこと" do
			expect(FactoryBot.build(:comment,:no_comment,customer_id: @customer.id,topick_id:@topick.id)).to_not be_valid
		end
	end
end