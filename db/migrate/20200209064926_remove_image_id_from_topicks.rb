class RemoveImageIdFromTopicks < ActiveRecord::Migration[5.2]
  def change
    remove_column :topicks, :image_id, :string
  end
end
