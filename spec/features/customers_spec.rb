require "rails_helper"
RSpec.feature "Customerに関するテスト", type: :feature do
	before do
		@customer1 = FactoryBot.create(:customer)
		@customer2 = FactoryBot.create(:customer, :create_with_topicks)
	end
	feature "ログインしていない状態で" do
		feature "以下のページにアクセスした際のリダイレクト先の確認" do
			scenario "customerの詳細ページ" do
				visit customer_path(@customer1)
				expect(page).to have_current_path new_customer_session_path
			end
		end
	end
	feature "ログインした状態で" do
		before do
			login(@customer1)
		end
		feature "表示内容とリンクの確認" do
			scenario "customerの詳細ページ" do
				visit customer_path(@customer1)
				expect(page).to have_content @customer1.name
			end
		end
	end

end