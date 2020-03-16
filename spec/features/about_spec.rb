require "rails_helper"
#login表示テスト
RSpec.feature "ヘッダー、アバウトページ、ログイン、ログアウトに関するテスト", type: :feature do
	before do
		@customer = FactoryBot.create(:customer)
	end

	feature "サインアップの確認" do
		before do
			visit new_customer_registration_path
			find_field('customer[name]').set("name_a")
			find_field('customer[email]').set("aa@aa")
			find_field('customer[password]').set("pppppp")
			find_field('customer[password_confirmation]').set("pppppp")
			find_field('customer[public_name]').set("name_b")
		end

		scenario "正しくサインアップ出来ている" do
			expect {
				find("input[name='commit']").click
			}.to change(Customer, :count).by(1)
		end
		scenario "リダイレクト先は正しい" do
			find("input[name='commit']").click
			expect(page).to have_current_path root_path
		end
	end

	feature "サインインの確認" do
		before do
			visit new_customer_session_path
			find_field('customer[email]').set(@customer.email)
			find_field("customer[password]").set(@customer.password)
			find("input[name='commit']").click
		end
		scenario "正しくログインして、リダイレクトされている" do
			expect(page).to have_current_path root_path
			expect(page).to have_link "",href: topicks_path
			expect(page).to have_link "",href: destroy_customer_session_path
		end
	end
end