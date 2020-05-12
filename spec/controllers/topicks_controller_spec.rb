require "rails_helper"
RSpec.describe TopicksController , type: :controller do
	describe "topick" do
		context "topページを表示する" do
			before do
				get :top
			end
			it "リクエストは200 ok " do
				expect(response.status).to eq 200
			end
		end
		context "一覧ページ表示する" do
			before do
				get :index
			end
			it "リクエストは200　okとすること" do
				expect(response.status).to eq 200
			end
		end
		context "新規投稿ページを表示" do
			before do
				get :about
			end
			it "リクエストは200" do
				expect(response.status).to eq 200
			end
		end
	end
end