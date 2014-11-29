class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :gender
      t.string :brand
      t.string :category
      t.timestamps
    end
  end
end
