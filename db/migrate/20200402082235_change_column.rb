class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :gest_inquiries, :unsolved,from: true,to:false
  end
end
