require "rails_helper"

Rspec.describe Customer, "モデルに関するテスト",type: :modle do
	describe "アソシエーション" do
		it "topickモデルを多数持っている" do
			is_expected.to have_many(:topicks)
		end
	end
end