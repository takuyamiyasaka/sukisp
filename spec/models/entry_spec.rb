require 'rails_helper'

RSpec.describe Entry, "モデルに関するテスト",type: :model do
	describe "アソシエーション" do
		it "customerモデルに属している" do
			is_expected.to belong_to(:customer)
		end
		it "roomモデルに属している" do
			is_expected.to belong_to(:room)
		end
	end
end
