class CreateGestInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :gest_inquiries do |t|
      t.string :gest_name
      t.string :gest_email
      t.text :gest_request
      t.boolean :unsolved

      t.timestamps
    end
  end
end
