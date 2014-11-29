class AddProductIdToPropertyValues < ActiveRecord::Migration
  def change
    add_column :property_values, :product_id, :integer
  end
end
