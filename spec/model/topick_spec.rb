require "rails_helper"
RSpec.describe Topick, type: :model do
	context "話題が正しく保存される" do
		it "データが保存されるかどうか" do
			expect(FactoryBot.buld(:topick)).to be_valid
		end
	end
end