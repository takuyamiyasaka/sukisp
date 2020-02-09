class AddTopickIdToTopickImageId < ActiveRecord::Migration[5.2]
  def change
    add_reference :topick_images, :topick, foreign_key: true
  end
end
