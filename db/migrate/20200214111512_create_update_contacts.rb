class CreateUpdateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :update_contacts do |t|
      t.text	:contact
      t.timestamps
    end
  end
end
