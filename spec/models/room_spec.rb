require 'rails_helper'

RSpec.describe Room, "モデルに関するテスト",type: :model do
  describe "アソシエーション" do
  	it "messageモデルを多数持っている" do
  		is_expected.to have_many(:messages)
  	end
  	it "entryモデルを多数持っている" do
  		is_expected.to have_many(:entries)
  	end
  end
end
