class ProductSerializer < ActiveModel::Serializer
  attributes :name, :price, :gender, :brand, :category, :property_values
end
