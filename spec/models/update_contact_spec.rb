require "rails_helper"

RSpec.describe UpdateContact ,type: :model do

	before do
		@update_contact = build(:update_contact)
	end
	describe "UpdateContactを保存する" do
		it "正しく保存されること" do
			expect(@update_contact).to be_valid
		end
		it "正しく保存されないこと" do
			expect(FactoryBot.build(:update_contact,:no_contact)).to_not be_valid
		end

	end
end