class AddMailToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :is_receive, :boolean, default: true, null: false
  end
end
