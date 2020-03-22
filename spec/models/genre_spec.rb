require "rails_helper"

RSpec.describe Genre, "genreモデルのテスト",type: :model do
	describe "アソシエーション" do
		it "topickモデルを多数持っている" do
			is_expected.to have_many(:topicks)
		end
	end
	before do
		@genre = build(:genre)
	end
	describe "genreモデルが保存される" do
		it "正常に保存される" do
			expect(@genre).to be_valid
		end
	end
	describe "genreモデルが正しく保存されない" do
		it "genre_nameが空" do
			expect(FactoryBot.build(:genre, :no_genre_name)).to_not be_valid
		end
	end
end