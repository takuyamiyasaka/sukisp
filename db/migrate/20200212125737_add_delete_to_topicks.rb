class AddDeleteToTopicks < ActiveRecord::Migration[5.2]
  def change
    add_column :topicks, :deleted_at, :datatime
  end
end
