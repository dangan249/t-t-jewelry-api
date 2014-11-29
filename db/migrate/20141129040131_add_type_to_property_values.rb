class AddTypeToPropertyValues < ActiveRecord::Migration
  def change
    add_column :property_values, :type, :string
  end
end
