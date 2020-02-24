require "rails_helper"
RSpec.describe Topick, type: :model do
	context "話題が正しく保存される" do
		before do
			@topick = Topick.new
			@topick.topick_name = "日本"
			@topick.introduction = "日本は広い"
			@topick.save
		end
		it "データが保存される" do
			expect(@topick).to be_valid
		end
	end
end