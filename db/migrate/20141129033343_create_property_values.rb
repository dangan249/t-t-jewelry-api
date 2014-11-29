class CreatePropertyValues < ActiveRecord::Migration
  def change
    create_table :property_values do |t|
      t.references :list
      t.timestamps
    end
  end
end
