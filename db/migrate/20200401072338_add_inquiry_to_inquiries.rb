class AddInquiryToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :inquiry_name, :string
    add_column :inquiries, :inquiry_email, :string
  end
end
