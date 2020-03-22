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

	feature "ログインいていない状態" do
		feature "以下のページにアクセスした際のリダイレクト先" do
			scenario "管理者のトップページへのアクセス" do
				visit top_admins_topicks_path
				expect(page).to have_current_path new_admin_session_path
			end
			scenario "管理者のジャンルページのアクセス" do
				visit admins_genres_path
				expect(page).to have_current_path new_admin_session_path
			end
			scenario "管理者の話題一覧のアクセス" do
				visit admins_topicks_path
				expect(page).to have_current_path new_admin_session_path
			end
			scenario "管理者の会員一覧のアクセス" do
				visit admins_customers_path
				expect(page).to have_current_path new_admin_session_path
			end
		end
	end
	feature "ログインした状態" do
		before do
			login(@admin)
		end
		feature "表示内容とリンク" do
			scenario "ヘッダーの表記とリンク" do
				visit top_admins_topicks_path
				expect(page).to have_link "", href: admins_genres_path
				expect(page).to have_content "ジャンル"
				expect(page).to have_link "", href: admins_topicks_path
				expect(page).to have_content "話題"
				expect(page).to have_link "", href: admins_customers_path
				expect(page).to have_content "会員一覧"
				expect(page).to have_link "", href: destroy_admin_session_path
				expect(page).to have_content "ログアウト"
			end
		end
		feature "genreの作成と表示" do
			before do
				visit admins_genres_path
				find_field("genre[genre_name]").set("title_a")
			end
			scenario "正しく保存できているか" do
				expect {
					find("input[name='commit']").click
				}.to change{ Genre.count }.by(1)
			end
			scenario "リダイレクト先の確認" do
				find("input[name='commit']").click
				expect(page).to have_current_path admins_genres_path
				expect(page).to have_content "title_a"
			end
		end
		feature "genreの編集と表示" do
			before do
				@genre = create(:genre)
				visit edit_admins_genre_path(@genre)
				find_field("genre[genre_name]").set("title_b")
				find("input[name='genre[is_valid]'][value='false']").set(true)
				find("input[name='commit']").click
			end
			scenario "genreの更新の確認" do
				expect(page).to have_content "title_b"
			end
			scenario "genreの更新後一覧ページ" do
				visit admins_genres_path
				expect(page).to have_content "無効"
			end
		end
	end
	#it { should have_checked_field 'publish', with '公開する' }
end
# "ジャンルの表記とリンク"
# "話題の表記とリンク"
# "会員の表記とリンク"


