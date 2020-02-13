class AddDeleteToTopickImages < ActiveRecord::Migration[5.2]
  def change
    add_column :topick_images, :deleted_at, :datatime
  end
end
