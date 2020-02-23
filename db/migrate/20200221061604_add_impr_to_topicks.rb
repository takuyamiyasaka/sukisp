class AddImprToTopicks < ActiveRecord::Migration[5.2]
  def change
    add_column :topicks, :impressions_count, :integer
  end
end
