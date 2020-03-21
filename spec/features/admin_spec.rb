require "rails_helper"
RSpec.feature "管理者のテスト",type: :feature do
	before do
		@admin = create(:admin)
	end
	feature "サインインの確認" do
		before do
			visit new_admin_session_path
			find_field("admin[email]").set(@admin.email)
			find_field("admin[password]").set(@admin.password)
			find("input[name='commit']").click
		end
		scenario "正しくログインして、リダイレクトされている" do
			expect(page).to have_current_path top_admins_topicks_path
		end
	end
	feature "ログアウトの確認" do
		before do
			login(@admin)
			visit top_admins_topicks_path
			all("a[data-method='delete'][href='/admins/sign_out']")[0].click
		end
		scenario "正しくログアウト" do
			expect(page).to have_current_path root_path
		end
	end
end


