require "rails_helper"
RSpec.feature "Customerに関するテスト", type: :feature do
	before do
		@customer1 = FactoryBot.create(:customer)
		@customer2 = FactoryBot.create(:customer)
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
			scenario "自分の詳細ページ" do
				visit customer_path(@customer1)
				expect(page).to have_content @customer1.name
				expect(page).to have_link "",href: edit_customer_path(@customer1)
				expect(page).to have_link "",href: new_topick_path
			end
			scenario "他人の詳細ページ" do
				visit customer_path(@customer2)
				expect(page).to have_content @customer2.public_name
				expect(page).to have_link "",href: new_topick_path
			end
		end

		feature "自分のプロフィールの更新" do
			before do
				visit edit_customer_path(@customer1)
				find_field('customer[name]').set('update_name')
				find_field('customer[public_name]').set('update_public_name')
				find("input[name='commit']").click
			end
			scenario "customer1が更新されているかどうか" do
				expect(page).to have_content "update_name"
				expect(page).to have_content "update_public_name"
			end
			scenario "リダイレクト先が正しいかどうか" do
				expect(page).to have_current_path customer_path(@customer1)
			end
		end
	end
end