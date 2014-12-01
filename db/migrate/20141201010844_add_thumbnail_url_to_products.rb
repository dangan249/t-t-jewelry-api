class AddThumbnailUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :thumbnail_url, :string
  end
end
