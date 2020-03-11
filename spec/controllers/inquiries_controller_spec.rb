require "rails_helper"
RSpec.describe InquiriesController, tupe: :controller do
	describe "問い合わせページ" do
		context "問い合わせページを表示する" do
			before do
				get :new
			end
			it "リクエストは200 okとすること" do
				expect(response.status).to eq 200
			end
		end
	end
end
