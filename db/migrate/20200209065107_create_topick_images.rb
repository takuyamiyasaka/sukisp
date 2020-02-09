class CreateTopickImages < ActiveRecord::Migration[5.2]
  def change
    create_table :topick_images do |t|
      t.string :topick_image_id
      t.timestamps
    end
  end
end
