class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.references :customer ,foreign_key: true
      t.text       :request
      t.timestamps
    end
  end
end
