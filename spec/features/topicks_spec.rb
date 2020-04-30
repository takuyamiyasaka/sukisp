require "rails_helper"
RSpec.feature "Topickに関するテスト",type: :feature do
	before do
		genre = create(:genre)
		@customer1 = create(:customer)
		@customer2 = create(:customer)
		@topick1 = FactoryBot.create(:topick, customer_id: @customer1.id, genre_id: genre.id)
		@topick2 = FactoryBot.create(:topick, customer_id: @customer2.id, genre_id: genre.id)

	end
	feature "ログインしていない状態" do
		feature "以下のページへアクセスした際のリダイレクト先の確認" do
			scenario "topickの一覧ページ" do
				visit topicks_path
				expect(page).to have_current_path topicks_path
			end
			scenario "topickの詳細ページ" do
				visit topick_path(@topick1)
				expect(page).to have_current_path topick_path(@topick1)
			end
			scenario "topickの新規投稿ページ" do
				visit new_topick_path
				expect(page).to have_current_path new_customer_session_path
			end
			scenario "topickの編集ページのリダイレクト先" do
				visit edit_topick_path(@topick1)
				expect(page).to have_current_path new_customer_session_path
			end
		end
	end
	feature "ログインした状態" do
		before do
			login(@customer1)
		end
		feature "topickのリンクの確認" do
			scenario "話題の一覧ページの表示内容とリンクは正しいか" do
				visit topicks_path
				topicks = Topick.all
				topicks.each do |topick|
					expect(page).to have_link topick.topick_name,href: topick_path(topick)
					expect(page).to have_content topick.topick_name
				end
			end
			scenario "話題新規投稿ページのリンク" do
				visit new_topick_path
				expect(page).to have_current_path new_topick_path
			end
			scenario "話題詳細ページのリンク" do
				visit topick_path(@topick1)
				expect(page).to have_content @topick1.topick_name
				expect(page).to have_link "",href:edit_topick_path(@topick1)
			end
			scenario "話題編集ページ自分が投稿したページ以外のリダイレクト" do
				visit edit_topick_path(@topick2)
				expect(page).to have_current_path topick_path(@topick2)
			end
		end
		feature "話題の更新" do
			before do
				topick = @topick1
				visit edit_topick_path(topick)
				find_field('topick[topick_name]').set('update_name_a')
				find("input[name='commit']").click
			end
			scenario "話題の更新されているか" do
				expect(page).to have_content "update_name_a"
			end
			scenario "リダイレクト先が正しいか" do
				expect(page).to have_current_path topick_path(@topick1)
			end
		end
		feature "コメントの追加" do
			before do
				visit topick_path(@topick1)
				find_field("comment[comment]").set("new_comment")
			end
			scenario "コメントがあるか" do
				expect {
					find("input[name='commit']").click }.to change(@topick1.comments,:count).by(1)
			end
		end
	end
end
	#"話題の詳細ページ"
	#{}"話題が編集ページ"
	#{}"話題が更新されたかどうか"