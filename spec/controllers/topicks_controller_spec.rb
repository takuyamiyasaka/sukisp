require "rails_helper"
RSpec.describe TopicksController, type: :controller do
	before do
		@topick = Topick.create(topick_name: "日本")
	end
	describe "topページの表示" do
		context "トップページが表示される。" do
			before do
				get :top
			end
			it "リクエストは200 okとなること" do
				expect(response.status).to eq 200
			end
		end
	end
	describe "indexページの表示" do
		context "indexページが表示される" do
			before do
				get :index
			end
			it "リクエストは200　okとすること" do
				expect(response.status).to eq 200
			end
		end
	end
	describe "aboutページの表示" do
		context "aboutページが表示される" do
			before do
				get :about
			end
			it "リクエストは200　okとすること" do
				expect(response.status).to eq 200
			end
		end
	end
	describe "showページの表示" do
		context "showページの表示が表示される" do
			before do
				 @topick_path
				get :show
			end
			it "リクエストは200 okとなること" do
				expect(response.status).to eq 200
			end
		end
	end
	describe "editページの表示" do
		context "editページの表示される" do
			before do
				get :edit
			end
			it "リクエストは200 okとなること" do
				expect(response.status).to eq 200
			end
		end
	end
	

	describe "newページが表示される" do
		context "newページが表示される" do
			before do
				get :new
			end
			it "リクエストは200　okとすること"do
			expect(response.status).to eq 200
		end
		end
	end
end