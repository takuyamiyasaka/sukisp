class AddProfielToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :self_introduction, :text
  end
end
