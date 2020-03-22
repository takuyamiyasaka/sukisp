require "rails_helper"

RSpec.describe TopickImage,"topick_imageモデルのテスト",type: :model do
	describe "アソシエーションのテスト" do
		it "topickに帰属している" do
			is_expected.to belong_to(:topick)
		end
	end
end