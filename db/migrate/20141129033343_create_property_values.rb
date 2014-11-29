class CreatePropertyValues < ActiveRecord::Migration
  def change
    create_table :property_values do |t|
      t.references :list_value
      t.string :value
      t.timestamps
    end
  end
end
