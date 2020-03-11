require "rails_helper"
RSpec.describe GenresController , type: :controller do
	describe "genreページ" do
		context "一覧ページ表示する" do
			before do
				get :index
			end
			it "リクエストは200　okとすること" do
				expect(response.status).to eq 200
			end
		end
	end

end