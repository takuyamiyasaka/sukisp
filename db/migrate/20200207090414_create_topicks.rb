class CreateTopicks < ActiveRecord::Migration[5.2]
  def change
    create_table :topicks do |t|
    	t.string 	 :topick_name
    	t.text   	 :introduction
    	t.string 	 :image_id
    	t.string 	 :topick_status
    	t.references :genre, 	foreign_key: true
    	t.references :customer,	foreign_key: true
    t.timestamps
    end
  end
end
