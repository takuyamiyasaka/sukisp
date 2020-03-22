require "rails_helper"
RSpec.describe Like, "likeモデルのテスト",type: :model do
	describe "アソシエーションのテスト" do
		it "customerモデルに帰属" do
			is_expected.to belong_to(:customer)
		end
		it "topickモデルに帰属" do
			is_expected.to belong_to(:topick)
		end
	end
end