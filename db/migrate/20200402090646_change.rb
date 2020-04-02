class Change < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :gest_inquiries, :unsolved,from: false, to: true
  end
end
