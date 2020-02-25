class Inquiries < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :inquiries, :is_receive, from: true, to: false
  end
end
