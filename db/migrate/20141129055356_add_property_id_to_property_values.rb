class AddPropertyIdToPropertyValues < ActiveRecord::Migration
  def change
    add_column :property_values, :property_id, :integer
  end
end
