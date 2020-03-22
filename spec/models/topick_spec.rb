require "rails_helper"

RSpec.describe Topick, type: :model do
	describe "アソシエーション" do
		it "Genreモデルに属している" do
			is_expected.to belong_to(:genre)
		end
		it "Customerモデルに属している" do
			is_expected.to belong_to(:customer)
		end
	end
	before do
		@topick = build(:topick)
	end
	describe "話題を保存する" do
		context "正しく保存される" do
			it "customer_idとgenre_idを入れて保存" do
				customer = create(:customer)
				genre = create(:genre)
				expect(FactoryBot.create(:topick, customer_id:customer.id,genre_id: genre.id)).to be_valid
			end
		end
	 	context "正しく保存されない" do
	 		it "customer_idを保存していないとき" do
	 			expect(@topick).to_not be_valid
	 		end
	 		it "genre_idを保存していないとき" do
	 			expect(@topick).to_not be_valid
	 		end
	 		it "topick_titleが空" do
	 			expect(FactoryBot.build(:topick, :no_topick_name)).to_not be_valid
	 		end
	 		it "introductionが空" do
	 			expect(FactoryBot.build(:topick, :no_introduction)).to_not be_valid
	 		end
	 	end
	end
end