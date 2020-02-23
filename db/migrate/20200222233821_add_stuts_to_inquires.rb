class AddStutsToInquires < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :unsolved, :boolean, default: true, null: false
  end
end
