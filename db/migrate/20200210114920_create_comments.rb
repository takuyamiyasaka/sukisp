class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references	:topick
      t.references  :customer
      t.text		:comment
      t.string		:image_id
      t.timestamps
    end
  end
end
